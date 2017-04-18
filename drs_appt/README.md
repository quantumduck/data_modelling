# Doctor's Appointment

Question 3 from Bitmaker assignment April 18, 2017.

## Step 1:
There could be much more information on the patients using associated objects,
but I will not implement this for now.

|doctors        |patients    |appointments   
|=======        |========    |============
|name           |name        |date
|specialty      |age         |start_time
                             |length
                             |type

## Step 2:
Each doctor can have many patients. Each patient can have many doctors, although
they can only have one primary care physician at a time. For simplicity, we will
assume that each appointment is one-on-one (no clinics).

Therefore, there is a many to many association between doctors and patients
through the appointments that they book.

There is a one to many association between doctors and patients as well, but this
one needs to have a different association name.

## Step 3:
Database schema

|doctors      |patients    |appointments   
|=======      |========    |============
|id           |id          |id
|name         |name        |date
|specialty    |age         |start_time
              |pcp_id      |length
                           |type
                           |doctor_id
                           |patient_id

## Step 4:
Generate the models
(See ./db and ./app/models)

## Step 5:
Create the associations
(see ./app/models)

## Checks:
``` Ruby



```
