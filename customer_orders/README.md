# Customers and Orders

Question 1 from Bitmaker assignment April 18, 2017.

## Step 1:
The models are already present:

|Customers         |Orders
|=========         |======
|email             |order number
|mailing address   |date
|name

## Step 2:
Each Customer can make many orders. Each Order is created by one Customer.
Therefore, there is a one to many relationship between Customers and Orders.

## Step 3:
Database schema

|Customers         |Orders
|=========         |======
|id                |id
|email             |order number
|mailing address   |date
|name              |customer_id

## Step 4:
Generate the models
(See ./db and ./app/models)

## Step 5:
Create the associations
(see ./app/models)

## Checks:
``` ruby
irb(main):001:0> c = Customer.create(email: "dummy@dumbmail.dum", mailing_address: "123 Dumb St. \n Dumbville, Dumbistan", name: "Dummy McDumbdumb")
   (0.1ms)  begin transaction
  SQL (0.6ms)  INSERT INTO "customers" ("email", "mailing_address", "name", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?)  [["email", "dummy@dumbmail.dum"], ["mailing_address", "123 Dumb St. \n Dumbville, Dumbistan"], ["name", "Dummy McDumbdumb"], ["created_at", 2017-04-18 16:22:03 UTC], ["updated_at", 2017-04-18 16:22:03 UTC]]
   (5.1ms)  commit transaction
=> #<Customer id: 1, email: "dummy@dumbmail.dum", mailing_address: "123 Dumb St. \n Dumbville, Dumbistan", name: "Dummy McDumbdumb", created_at: "2017-04-18 16:22:03", updated_at: "2017-04-18 16:22:03">
irb(main):002:0> c.orders.create(order_number: 1, date: Time.now)
   (0.1ms)  begin transaction
  SQL (0.7ms)  INSERT INTO "orders" ("order_number", "date", "customer_id", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?)  [["order_number", 1], ["date", Tue, 18 Apr 2017], ["customer_id", 1], ["created_at", 2017-04-18 16:30:32 UTC], ["updated_at", 2017-04-18 16:30:32 UTC]]
   (4.1ms)  commit transaction
=> #<Order id: 1, order_number: 1, date: "2017-04-18", customer_id: 1, created_at: "2017-04-18 16:30:32", updated_at: "2017-04-18 16:30:32">
irb(main):003:0>
```
