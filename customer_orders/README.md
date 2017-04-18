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
