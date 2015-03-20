Session.set("currentOrder", randomOrder())
Session.set("creatingOrder", false)
Session.set("lastInvoiceId", null)

Template.orderEntry.helpers
  currentOrder: ->
    Session.get("currentOrder")
  creatingOrder: ->
    Session.get("creatingOrder")
  lastInvoiceId: ->
    Session.get("lastInvoiceId")

Template.orderEntry.events
  "submit .new-order": (event) ->
    Session.set("creatingOrder", true)

    order =
      _internal_created: new Date()
      _closed: false
      _disputeOpen: false
      _alerted: (event.target.amountDueOriginal.value > 1000 || event.target.accountType.value is "Key Account").toString()
      invoiceId: event.target.invoiceId.value
      invoiceDate: event.target.invoiceDate.value
      amountDueOriginal: event.target.amountDueOriginal.value
      partyName: event.target.partyName.value
      accountNumber: event.target.accountNumber.value
      accountType: event.target.accountType.value
      lineOfBusiness: event.target.lineOfBusiness.value
      product1: event.target.product1.value
      sourceName: event.target.sourceName.value
      processType: event.target.processType.value
      delivery: event.target.delivery.value
      disputedCase: event.target.disputedCase.value
      disputeStatus: event.target.disputeStatus.value
      disputeReasonCode: event.target.disputeReasonCode.value
      fromBlueMix: "true"

    finishOrder = ->
      Session.set("currentOrder", randomOrder())
      Session.set("creatingOrder", false)
      Session.set("lastInvoiceId", order.invoiceId)


    Meteor.call "createOrder", order, (error, response) ->
      if (error)
        console.log(error)

      order._id = response

      if (order._alerted is "true")
        Meteor.call "disputeOrder", order, (error, response) ->
          if (error)
            console.log(error)
          finishOrder()
      else
        finishOrder()

    false
