# Gythub

Question 5 from Bitmaker assignment April 18, 2017.

## Step 1:
We can get away with only the name field in the repository. If we wanted to
implement an MVP, we would need to at least have a path to the repository files
on the server, although this is not very secure. Obviously, the path would be
relative to a directory for the individual user.

|users          |repositories   
|=======        |============
|name           |name
|email          |path
                |forked


## Step 2:
Each user may have many repositories. Each repository is created by one user,
but can have many users allowed to use it. Each repository is forked from one
or zero repositories.

## Step 3:
Database schema.

|users          |repositories  |repositories_users
|=======        |============  |==================
|id             |id            |user_id
|name           |name          |repository_id
|email          |path
                |creator_id
                |fork_id

## Step 4:
Generate the models
(See ./db and ./app/models)

## Step 5:
Create the associations
(see ./app/models)

## Checks:
``` Ruby

irb(main):001:0> u1 = User.create(name: "Dumbo1", email: "dumbo1@dumbotron.net")
   (0.1ms)  begin transaction
  SQL (0.7ms)  INSERT INTO "users" ("name", "email", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["name", "Dumbo1"], ["email", "dumbo1@dumbotron.net"], ["created_at", 2017-04-18 21:28:58 UTC], ["updated_at", 2017-04-18 21:28:58 UTC]]
   (5.2ms)  commit transaction
=> #<User id: 7, name: "Dumbo1", email: "dumbo1@dumbotron.net", created_at: "2017-04-18 21:28:58", updated_at: "2017-04-18 21:28:58">
irb(main):002:0> u2 = User.create(name: "Dumbo1", email: "dumbo2@dumbotron.net")
   (0.2ms)  begin transaction
  SQL (0.9ms)  INSERT INTO "users" ("name", "email", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["name", "Dumbo1"], ["email", "dumbo2@dumbotron.net"], ["created_at", 2017-04-18 21:29:07 UTC], ["updated_at", 2017-04-18 21:29:07 UTC]]
   (9.1ms)  commit transaction
=> #<User id: 8, name: "Dumbo1", email: "dumbo2@dumbotron.net", created_at: "2017-04-18 21:29:07", updated_at: "2017-04-18 21:29:07">
irb(main):003:0> u1.created_repositories.create(name: "stuff", path: "path/to/stuff", fork_id: 0)
   (0.1ms)  begin transaction
  User Load (0.2ms)  SELECT  "users".* FROM "users" WHERE "users"."id" = ? LIMIT ?  [["id", 7], ["LIMIT", 1]]
  SQL (0.6ms)  INSERT INTO "repositories" ("name", "path", "creator_id", "fork_id", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?, ?)  [["name", "stuff"], ["path", "path/to/stuff"], ["creator_id", 7], ["fork_id", 0], ["created_at", 2017-04-18 21:30:23 UTC], ["updated_at", 2017-04-18 21:30:23 UTC]]
   (5.7ms)  commit transaction
=> #<Repository id: 1, name: "stuff", path: "path/to/stuff", creator_id: 7, fork_id: 0, created_at: "2017-04-18 21:30:23", updated_at: "2017-04-18 21:30:23">
irb(main):004:0> u2.fork(u1.created_repositories.first)
  Repository Load (0.5ms)  SELECT  "repositories".* FROM "repositories" WHERE "repositories"."creator_id" = ? ORDER BY "repositories"."id" ASC LIMIT ?  [["creator_id", 7], ["LIMIT", 1]]
   (0.1ms)  begin transaction
  User Load (0.3ms)  SELECT  "users".* FROM "users" WHERE "users"."id" = ? LIMIT ?  [["id", 8], ["LIMIT", 1]]
  SQL (0.8ms)  INSERT INTO "repositories" ("name", "path", "creator_id", "fork_id", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?, ?)  [["name", "stuff"], ["path", "path/to/stuff"], ["creator_id", 8], ["fork_id", 1], ["created_at", 2017-04-18 21:31:20 UTC], ["updated_at", 2017-04-18 21:31:20 UTC]]
   (6.1ms)  commit transaction
=> #<Repository id: 2, name: "stuff", path: "path/to/stuff", creator_id: 8, fork_id: 1, created_at: "2017-04-18 21:31:20", updated_at: "2017-04-18 21:31:20">

```
