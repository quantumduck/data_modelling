# Eventbryte

Question 4 from Bitmaker assignment April 18, 2017.

## Step 1:
There can be different classes for hosts and guests, but people will perform
both roles, so it is best to keep them in the same database column to avoid
duplication. Location could be moved to a Venue table.

|users          |events   
|=======        |============
|name           |name
|email          |date
|age            |start_time
                |length
                |min_age
                |location
                |description

## Step 2:
Each user can host many events and can be a guest at many events. Each event has
one host, and can have many guests, but the host_id in events is actually the id
of a guest. If we use venues, each event has one venue, and each venue can have
many events, guests, and hosts.

## Step 3:
Database schema. Users have been renamed to guests. The host_id field is actually
a guest_id, but it needs a unique name. Date and start_time are changed to time,
since the datetime type will store them both.

|guests         |events         |events_guests
|=======        |============   |============
|name           |name           |event_id
|email          |time           |user_id
|age            |length
                |min_age
                |location
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

irb(main):001:0> h = Guest.create(name: "Hosty McHost", email: "hosty@hostname.com", age: 30)
   (0.1ms)  begin transaction
  SQL (0.6ms)  INSERT INTO "guests" ("name", "email", "age", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?)  [["name", "Hosty McHost"], ["email", "hosty@hostname.com"], ["age", 30], ["created_at", 2017-04-18 19:39:41 UTC], ["updated_at", 2017-04-18 19:39:41 UTC]]
   (7.0ms)  commit transaction
=> #<Guest id: 1, name: "Hosty McHost", email: "hosty@hostname.com", age: 30, created_at: "2017-04-18 19:39:41", updated_at: "2017-04-18 19:39:41">
irb(main):002:0> g = Guest.create(name: "Guesty McGuest", email: "gmg@guester.com", age: 20)
   (0.2ms)  begin transaction
  SQL (1.0ms)  INSERT INTO "guests" ("name", "email", "age", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?)  [["name", "Guesty McGuest"], ["email", "gmg@guester.com"], ["age", 20], ["created_at", 2017-04-18 19:45:12 UTC], ["updated_at", 2017-04-18 19:45:12 UTC]]
   (5.8ms)  commit transaction
=> #<Guest id: 2, name: "Guesty McGuest", email: "gmg@guester.com", age: 20, created_at: "2017-04-18 19:45:12", updated_at: "2017-04-18 19:45:12">
irb(main):003:0> h.hosted_events.create(name: "Fun Event", time: Time.now, length: 2, min_age: 0, location: "here", description: "whatever")
   (0.1ms)  begin transaction
  Guest Load (0.2ms)  SELECT  "guests".* FROM "guests" WHERE "guests"."id" = ? LIMIT ?  [["id", 1], ["LIMIT", 1]]
  SQL (0.6ms)  INSERT INTO "events" ("name", "time", "length", "min_age", "location", "description", "host_id", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)  [["name", "Fun Event"], ["time", 2017-04-18 19:47:10 UTC], ["length", 0.2e1], ["min_age", 0], ["location", "here"], ["description", "whatever"], ["host_id", 1], ["created_at", 2017-04-18 19:47:10 UTC], ["updated_at", 2017-04-18 19:47:10 UTC]]
   (5.1ms)  commit transaction
=> #<Event id: 1, name: "Fun Event", time: "2017-04-18 19:47:10", length: 0.2e1, min_age: 0, location: "here", description: "whatever", host_id: 1, created_at: "2017-04-18 19:47:10", updated_at: "2017-04-18 19:47:10">
irb(main):004:0> g.rsvp(h.hosted_events.first)
  Event Load (0.7ms)  SELECT  "events".* FROM "events" WHERE "events"."host_id" = ? ORDER BY "events"."id" ASC LIMIT ?  [["host_id", 1], ["LIMIT", 1]]
   (0.1ms)  begin transaction
  SQL (0.7ms)  INSERT INTO "events_guests" ("event_id", "guest_id") VALUES (?, ?)  [["event_id", 1], ["guest_id", 2]]
   (5.8ms)  commit transaction
  Event Load (0.5ms)  SELECT "events".* FROM "events" INNER JOIN "events_guests" ON "events"."id" = "events_guests"."event_id" WHERE "events_guests"."guest_id" = ?  [["guest_id", 2]]
=> #<ActiveRecord::Associations::CollectionProxy [#<Event id: 1, name: "Fun Event", time: "2017-04-18 19:47:10", length: 0.2e1, min_age: 0, location: "here", description: "whatever", host_id: 1, created_at: "2017-04-18 19:47:10", updated_at: "2017-04-18 19:47:10">]>
irb(main):005:0>


```
