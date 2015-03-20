Router.configure
  layoutTemplate: "layout"
  loadingTemplate: "loading"
  notFoundTemplate: "notFound"

Router.route "/",
  onBeforeAction: ->
    Router.go(Meteor.settings.public.defaultScreen)

Router.route "/order-entry",
  name: "order-entry"
  onBeforeAction: ->
    Session.set("title", "Order Entry")
    @next()

Router.route "/order-list",
  name: "order-list"
  onBeforeAction: ->
    Session.set("title", "Order Management")
    @next()
