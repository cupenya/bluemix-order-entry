config = Meteor.settings



cupenya = @cupenya


Meteor.publish "orders", ->
  Orders.find()

Meteor.startup ->
  console.log("Starting application")
  console.log("Config dump:")
  console.log(config)
  if (process.env["VCAP_SERVICES"])
    console.log "Found VCAP variable, using for config override"
    vcap = JSON.parse(process.env["VCAP_SERVICES"])
    cpy = vcap["cpy-insights"]
    if (cpy)
      console.log "Using Cupenya binding"
      config.insights.engine.endpoint = cpy[0].credentials.endpoint
      config.insights.engine.apiKey = cpy[0].credentials.apiKey
      console.log("Config dump after binding:")
      console.log(config)
    else
      console.log "Could not find Cupenya insights binding"

###
# event.eventId: the event ID
# event.instanceId: the ID of the process instance
# event.context: A map of values to use
###
logInsightsEvent = (eventId, eventType, instanceId, context = {}, timestamp = new Date().getTime()) ->
  # clean up context
  delete context._id
  delete context._internal_created
  delete context._closed
  delete context._disputeOpen

  insightsEvent =
    id: cupenya.util.generateRandomUuid()
    eventId: eventId
    eventType: eventType
    instanceId: instanceId
    processId: cupenya.util.generateRandomUuid() # for later use
    parentProcessId: null # for later use
    timestamp: timestamp
    processContext: context

  Meteor.http.post(
    "#{config.insights.engine.endpoint}/events/",
    {
      data: insightsEvent
      headers:
        "Content-Type": "application/json"
        "x-api-key": config.insights.engine.apiKey
    },
    (error, response) ->
      if (error)
        console.log(error)
        console.log(insightsEvent)
      else
        console.log("Transmitted event #{insightsEvent.id}")
  )


Meteor.methods
  createOrder: (order) ->
    insertedOrderId = Orders.insert(order)

    logInsightsEvent("invoiceCreated", "ELEMENT_BEGIN", order.invoiceId, order)
    logInsightsEvent("invoiceCreated", "ELEMENT_END", order.invoiceId, order)

    logInsightsEvent("waitingForPayment", "ELEMENT_BEGIN", order.invoiceId, order)

    # simulate other events from backend processes
    logInsightsEvent("invoicePrinted", "ELEMENT_BEGIN", order.invoiceId, order)
    logInsightsEvent("invoicePrinted", "ELEMENT_END", order.invoiceId, order)

    insertedOrderId

  disputeOrder: (order) ->
    order._disputeOpen = true
    Orders.update(_id: order._id, order)

    logInsightsEvent("disputed", "ELEMENT_BEGIN", order.invoiceId, order)

  closeDispute: (order) ->
    order._disputeOpen = false
    order._alerted = "false"
    Orders.update(_id: order._id, order)

    logInsightsEvent("disputed", "ELEMENT_END", order.invoiceId, order)

  closeOrder: (order) ->
    order._closed = true
    Orders.update(_id: order._id, order)

    logInsightsEvent("waitingForPayment", "ELEMENT_END", order.invoiceId, order)

    logInsightsEvent("autoMatched", "ELEMENT_BEGIN", order.invoiceId, order)
    logInsightsEvent("autoMatched", "ELEMENT_END", order.invoiceId, order)

  matchManually: (order) ->
    order._closed = true
    Orders.update({_id: order._id}, order)

    logInsightsEvent("waitingForPayment", "ELEMENT_END", order.invoiceId, order)

    logInsightsEvent("manuallyMatched", "ELEMENT_BEGIN", order.invoiceId, order)
    logInsightsEvent("manuallyMatched", "ELEMENT_END", order.invoiceId, order)
