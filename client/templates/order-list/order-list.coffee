Template.orderList.helpers
  orders: -> Orders.find({}, {sort: {_internal_created: -1}})

Template.orderList.events
  "click input#close": (event) ->
    order = @

    Meteor.call "closeOrder", order, (error, response) ->
      if (error)
        console.log(error)

    false

  "click input#matchedManually": (event) ->
    order = @

    Meteor.call "matchManually", order, (error, response) ->
      if (error)
        console.log(error)

    false

  "click input#closeDispute": (event) ->
    order = @

    Meteor.call "closeDispute", order, (error, response) ->
      if (error)
        console.log(error)

    false
