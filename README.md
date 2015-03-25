# Cupenya Insights Bluemix Order Entry Example

This example application demonstrates how to use the Cupenya Insights API in a Bluemix application that is based on Node.JS. Specifically it uses the Meteor Framework to develop a simple order entry and management screen. The relevant business activities are logged to Cupenya Insights on Bluemix and then can be analyzed.

# Try It for Free in 1 Minute

To try it out, you need a Bluemix account and then you can deploy us with one click, the necessary services, e.g. Cupenya Insights and a database are created on the fly.



# Instructions

Press Deploy to Blumix button: [![Deploy to Bluemix](https://bluemix.net/deploy/button.png)](https://bluemix.net/deploy?repository=https://github.com/cupenya/bluemix-order-entry.git)

Press Log in button and provide your bluemix credentials

![Step 1](http://www.cupenya.com/blog/wp-content/uploads/2015/03/step1.png)

![Step 2](http://www.cupenya.com/blog/wp-content/uploads/2015/03/step2.png)
Notice: If you are signing in for the first time, you will be asked to create an alias as well.

Press Deploy

![Step 3](http://www.cupenya.com/blog/wp-content/uploads/2015/03/step3.png)

Press “View Your App” to be redirected to order-entry app

![Step 4](http://www.cupenya.com/blog/wp-content/uploads/2015/03/step4.png)

Create an order in Bluemix App
Hint: Make it a Key account and over 1000 dollars to have a guaranteed dispute.

![Step 5](http://www.cupenya.com/blog/wp-content/uploads/2015/03/step5.png)

Return to the Bluemix Dashboard. Scroll down to the “Services” section and click on Cupenya Insights.

![Step 6](http://www.cupenya.com/blog/wp-content/uploads/2015/03/step6.png)

Click on "open cupenya insights dashboard"

![Step 7](http://www.cupenya.com/blog/wp-content/uploads/2015/03/step7.png)

Select Bluemix Order to Cash - Template

![Step 8](http://www.cupenya.com/blog/wp-content/uploads/2015/03/step8.png)

Go to the Editor and click on the settings button

![Step 9](http://www.cupenya.com/blog/wp-content/uploads/2015/03/step9.png)

Select connectors tab and Enable the Bluemix Deployment Connector

![Step 10](http://www.cupenya.com/blog/wp-content/uploads/2015/03/step10.png)

Press the button "Assign New Connectors", Confirm and press Save.

Map the process tasks such “Create Invoice” to the underlying system. In this example, enable the Bluemix adaptor and link the appropriate event for:
- Create Invoice
- Generate & Send Invoice
- Waiting for Payment
- Handle Dispute

First, click the "Connect System" button.

![Step 11](http://www.cupenya.com/blog/wp-content/uploads/2015/03/step11.png)

Then assign the Bluemix connector, set "Complete Event" as Event Mapping and choose the relevant Element Event from the list. An example is shown in the image below.

![Step 12](http://www.cupenya.com/blog/wp-content/uploads/2015/03/step12.png)

Important Notice: If event mapping is missing, create data using the order-entry app. 

Repeat the same steps for tasks "Generate & Send Invoice", "Waiting for Payment" and "Handle Dispute" and then click Activate in the top right corner and press Deploy.

![Step 13](http://www.cupenya.com/blog/wp-content/uploads/2015/03/step13.png)

Note: To map "Waiting for Payment" and "Handle Dispute" double-click on Payment
![Step 17](http://www.cupenya.com/blog/wp-content/uploads/2015/03/step17.png)

Open cupenya insights monitor to see your order details

![Step 14](http://www.cupenya.com/blog/wp-content/uploads/2015/03/step14.png)

Open the Order List in your deployed Bluemix application to take actions to Close, Manually Match or Resolve Dispute for your open invoices

![Step 16](http://www.cupenya.com/blog/wp-content/uploads/2015/03/step16.png)

Switch between Bluemix application and Cupenya Insights to see orders appear and change in the monitor.

![Step 15](http://www.cupenya.com/blog/wp-content/uploads/2015/03/step15.png)
