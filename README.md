**Table of Contents**

- [Cupenya Insights Bluemix Order Entry Example](#cupenya-insights-bluemix-order-entry-example)
- [Try It for Free in 1 Minute](#try-it-for-free-in-1-minute)
- [Instructions](#instructions)
  - [Deploy the app using the command line](#deploy-the-app-using-the-command-line)
- [Technical Details](#technical-details)

## Cupenya Insights Bluemix Order Entry Example

This example application demonstrates how to use the Cupenya Insights API in a Bluemix application that is based on Node.JS. Specifically it uses the Meteor Framework to develop a simple order entry and management screen. The relevant business activities are logged to Cupenya Insights on Bluemix and then can be analyzed.

## Try It for Free in 1 Minute

To try it out, you need a Bluemix account and then you can deploy us with one click, the necessary services, e.g. Cupenya Insights and a database are created on the fly.



## Instructions

### Deploy the app using the command line

0. `git clone https://github.com/cupenya/bluemix-order-entry.git`
0. `install cf client` https://github.com/cloudfoundry/cli
0. `cd bluemix-order-entry`
0. `cf login -a https://api.ng.bluemix.net -u username@example.com -p mypassword`
0. `cf create-service mongolab sandbox cpy-bluemix-demo-mongodb`
0. `cf create-service cpy-insights free cupenya-insights`
0. `cf push <app-name>` services are automatically binded to the app

## Technical Details

This finishes the tutorial on how to get the app and Cupenya Insights connected on Bluemix. Please explore the documented example code to see how to instrument your own application. Below are some code examples that are referenced to the Meteor sample code to log some events. Please note that this code will only work without configuration in a Bluemix environment. If you want to test the application locally, check the ```local-settings.json``` file and overwrite it manually with the settings that your binding shows in Bluemix.

To log any business event within the Meteor application on the server side, the following code is necessary:

```coffeescript
# web service method
disputeOrder: (order) ->
  # database update
  order._disputeOpen = true
  Orders.update(_id: order._id, order)

  # Cupenya event logging, mark the activity "disputed" as started, using the invoiceId as a primary
  # reference and passing in the order as context data that is automatically added to Cupenya data fields
  logInsightsEvent("disputed", "ELEMENT_BEGIN", order.invoiceId, order)

# web service method
closeDispute: (order) ->
  # database update
  order._disputeOpen = false
  Orders.update(_id: order._id, order)
  
  # Cupenya event logging, mark the activity "disputed" as finished.
  logInsightsEvent("disputed", "ELEMENT_END", order.invoiceId, order)
```
