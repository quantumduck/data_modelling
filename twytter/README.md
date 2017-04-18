# Twytter

Question 6 from Bitmaker assignment April 18, 2017.

## Step 1:
The two tables we need are pretty clear:

|users          |tweets   
|=======        |============
|name           |contents
|email          
|bio


## Step 2:
Each user can write many tweets. Each tweet is written by one user, but can be
retweeted by many users. Each retweet has one original source tweet. Each user
can follow many users and can be followed by many users. This will require a
users_users table, but it will need to be called something different, like
follower_pairs. Retweets does not necessarily have to be a model either.

## Step 3:
Database schema.

|users          |tweets        |retweets   |follow_pairs
|=======        |============  |========   =============
|id             |id            |id         |leader_id
|name           |contents      |source_id  |follower_id
|email          |user_id       |user_id

## Step 4:
Generate the models
(See ./db and ./app/models)

## Step 5:
Create the associations
(see ./app/models)

## Checks:
``` Ruby



```
