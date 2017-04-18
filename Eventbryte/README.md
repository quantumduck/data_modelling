# Doctor's Appointment

Question 3 from Bitmaker assignment April 18, 2017.

## Step 1:
There can be different classes for hosts and guests, but people will perform
both roles, so it is best to keep them in the same database column to avoid
duplication.

|users          |events   
|=======        |============
|name           |name
|age            |date
                |start_time
                |length
                |min_age
                |description

## Step 2:
Each user can host many events and can be a guest at many events. Each event has
one host, and can have many guests, but the host_id in events is actually the id
of a guest.

## Step 3:
Database schema. Users have been renamed to guests. The host_id field is actually
a guest_id, but it needs a unique name.

|guests         |events         |events_guests
|=======        |============   |============
|name           |name           |event_id
|age            |date           |user_id
                |start_time
                |length
                |min_age
                |description
                |host_id

## Step 4:
Generate the models
(See ./db and ./app/models)

## Step 5:
Create the associations
(see ./app/models)

## Checks:
``` Ruby



```
