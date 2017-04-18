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

irb(main):001:0> u1 = User.create(name: "Tweedle-Dum", email: "dum.tweedle@wonderland.org")
   (0.1ms)  begin transaction
  SQL (0.6ms)  INSERT INTO "users" ("name", "email", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["name", "Tweedle-Dum"], ["email", "dum.tweedle@wonderland.org"], ["created_at", 2017-04-18 22:27:49 UTC], ["updated_at", 2017-04-18 22:27:49 UTC]]
   (4.8ms)  commit transaction
=> #<User id: 1, name: "Tweedle-Dum", email: "dum.tweedle@wonderland.org", created_at: "2017-04-18 22:27:49", updated_at: "2017-04-18 22:27:49">
irb(main):002:0> u2 = User.create(name: "Tweedle-Dee", email: "dee.tweedle@wonderland.org")
   (0.2ms)  begin transaction
  SQL (0.9ms)  INSERT INTO "users" ("name", "email", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["name", "Tweedle-Dee"], ["email", "dee.tweedle@wonderland.org"], ["created_at", 2017-04-18 22:28:20 UTC], ["updated_at", 2017-04-18 22:28:20 UTC]]
   (5.9ms)  commit transaction
=> #<User id: 2, name: "Tweedle-Dee", email: "dee.tweedle@wonderland.org", created_at: "2017-04-18 22:28:20", updated_at: "2017-04-18 22:28:20">
irb(main):006:0> u1.tweets.create(contents: "hello world")
   (0.2ms)  begin transaction
  SQL (1.1ms)  INSERT INTO "tweets" ("contents", "user_id", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["contents", "hello world"], ["user_id", 1], ["created_at", 2017-04-18 22:31:37 UTC], ["updated_at", 2017-04-18 22:31:37 UTC]]
   (5.5ms)  commit transaction
=> #<Tweet id: 1, contents: "hello world", user_id: 1, created_at: "2017-04-18 22:31:37", updated_at: "2017-04-18 22:31:37">
irb(main):006:0>u2.retweets.create(source: u1.tweets.first)
  Tweet Load (0.3ms)  SELECT  "tweets".* FROM "tweets" WHERE "tweets"."user_id" = ? ORDER BY "tweets"."id" ASC LIMIT ?  [["user_id", 1], ["LIMIT", 1]]
   (0.1ms)  begin transaction
  SQL (0.9ms)  INSERT INTO "retweets" ("source_id", "user_id", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["source_id", 1], ["user_id", 2], ["created_at", 2017-04-18 22:33:05 UTC], ["updated_at", 2017-04-18 22:33:05 UTC]]
   (6.9ms)  commit transaction
=> #<Retweet id: 1, source_id: 1, user_id: 2, created_at: "2017-04-18 22:33:05", updated_at: "2017-04-18 22:33:05">


```
