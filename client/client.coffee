Template.registerHelper "checkedIf", (value) ->
  if value then "checked" else ""

Template.registerHelper "selectedIfEquals", (left, right) ->
  if left is right then "selected" else ""

Meteor.subscribe("orders")
