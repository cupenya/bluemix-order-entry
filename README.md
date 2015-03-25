# Cupenya Insights Bluemix Order Entry Example

This example application demonstrates how to use the Cupenya Insights API in a Bluemix application that is based on Node.JS. Specifically it uses the Meteor Framework to develop a simple order entry and management screen. The relevant business activities are logged to Cupenya Insights on Bluemix and then can be analyzed.

# Try It for Free in 1 Minute

To simply try it you need a Bluemix account and then you can deploy us with one click, the necessary services, e.g. Cupenya Insights and a database are created on the fly.



# Instructions

1 Press Deploy to Blumix button: [![Deploy to Bluemix](https://bluemix.net/deploy/button.png)](https://bluemix.net/deploy?repository=https://github.com/cupenya/bluemix-order-entry.git)

2 Press Log in button and provide your bluemix credentials

[![Step 1](http://www.cupenya.com/blog/wp-content/uploads/2015/03/step1.png)]

[![Step 2](http://www.cupenya.com/blog/wp-content/uploads/2015/03/step2.png)]

3 Select Region, Organization and Space and Deploy your application

[![Step 3](http://www.cupenya.com/blog/wp-content/uploads/2015/03/step3.png)]

4 Press “View Your App” to be redirected to order-entry app

[![Step 4](http://www.cupenya.com/blog/wp-content/uploads/2015/03/step4.png)]

5 Create an order in Bluemix App 
Hint: Make it a Key account and over 1000 dollars to have a guaranteed dispute.

[![Step 5](http://www.cupenya.com/blog/wp-content/uploads/2015/03/step5.png)]

6 Return to the Bluemix Dashboard. Scroll down to the “Services” section and click on Cupenya Insights and then click on "open cupenya insights dashboard" then click on "open cupenya insights dashboard"

[![Step 6](http://www.cupenya.com/blog/wp-content/uploads/2015/03/step6.png)]

[![Step 7](http://www.cupenya.com/blog/wp-content/uploads/2015/03/step7.png)]


7 Select Bluemix Order to Cash - Template

[![Step 8](http://www.cupenya.com/blog/wp-content/uploads/2015/03/step8.png)]

8 Go to the Editor and click on the settings button

[![Step 9](http://www.cupenya.com/blog/wp-content/uploads/2015/03/step9.png)]

9 Select connectors tab and Enable the Bluemix Deployment Connector

[![Step 10](http://www.cupenya.com/blog/wp-content/uploads/2015/03/step10.png)]

10 Press assign connector and then confirm

11 Press Save

12 Map tasks to the systems that execute them. In this example, enable the Bluemix adaptor and link the appropriate event for: 
- Create Invoice
- Disputed
- Manually Matched

If event is missing, make sure it has been previously triggered.

First, click the "Connect System" button.

[![Step 11](http://www.cupenya.com/blog/wp-content/uploads/2015/03/step11.png)]

13 Then assign the Bluemix connector and set the correct Element Event.

[![Step 12](http://www.cupenya.com/blog/wp-content/uploads/2015/03/step12.png)]

14 Repeat the same steps for tasks "Disputed Invoice" and "Manually Matched" and then click Activate in the top right corner and press Deploy.

[![Step 13](http://www.cupenya.com/blog/wp-content/uploads/2015/03/step13.png)]

15 Open cupenya insights monitor to see your order details

[![Step 14](http://www.cupenya.com/blog/wp-content/uploads/2015/03/step14.png)]

16 Open the Order List to take actions to Close, Manually Match or Resolve Dispute for your open invoices

[![Step 16](http://www.cupenya.com/blog/wp-content/uploads/2015/03/step16.png)]

17 Switch between Bluemix application and Cupenya Insights to see orders appear and change in the monitor.

[![Step 15](http://www.cupenya.com/blog/wp-content/uploads/2015/03/step15.png)]
