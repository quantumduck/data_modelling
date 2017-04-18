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

irb(main):001:0> d = Doctor.new(name: "Dr. Doctorface", specialty: "General Practice")
=> #<Doctor id: nil, name: "Dr. Doctorface", specialty: "General Practice", created_at: nil, updated_at: nil>
irb(main):002:0> d = Doctor.create(name: "Dr. Doctorface", specialty: "General Practice")
   (0.2ms)  begin transaction
  SQL (0.9ms)  INSERT INTO "doctors" ("name", "specialty", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["name", "Dr. Doctorface"], ["specialty", "General Practice"], ["created_at", 2017-04-18 18:22:19 UTC], ["updated_at", 2017-04-18 18:22:19 UTC]]
   (5.5ms)  commit transaction
=> #<Doctor id: 2, name: "Dr. Doctorface", specialty: "General Practice", created_at: "2017-04-18 18:22:19", updated_at: "2017-04-18 18:22:19">
irb(main):003:0> Patient.last
  Patient Load (0.4ms)  SELECT  "patients".* FROM "patients" ORDER BY "patients"."id" DESC LIMIT ?  [["LIMIT", 1]]
=> #<Patient id: 1, name: "Dummy McDumbface", age: 50, pcp_id: 1, created_at: "2017-04-18 18:09:23", updated_at: "2017-04-18 18:09:23">
irb(main):004:0> p = Patient.last
  Patient Load (0.3ms)  SELECT  "patients".* FROM "patients" ORDER BY "patients"."id" DESC LIMIT ?  [["LIMIT", 1]]
=> #<Patient id: 1, name: "Dummy McDumbface", age: 50, pcp_id: 1, created_at: "2017-04-18 18:09:23", updated_at: "2017-04-18 18:09:23">
irb(main):005:0> d
=> #<Doctor id: 2, name: "Dr. Doctorface", specialty: "General Practice", created_at: "2017-04-18 18:22:19", updated_at: "2017-04-18 18:22:19">
irb(main):006:0> a = p.appointments.build
DEPRECATION WARNING: Time columns will become time zone aware in Rails 5.1. This
still causes `String`s to be parsed as if they were in `Time.zone`,
and `Time`s to be converted to `Time.zone`.

To keep the old behavior, you must add the following to your initializer:

    config.active_record.time_zone_aware_types = [:datetime]

To silence this deprecation warning, add the following:

    config.active_record.time_zone_aware_types = [:datetime, :time]
 (called from irb_binding at (irb):6)
=> #<Appointment id: nil, date: nil, start_time: nil, length: nil, purpose: nil, doctor_id: nil, patient_id: 1, created_at: nil, updated_at: nil>
irb(main):007:0> a = p.appointments.build(start_time: Time.now, date: Time.now, length: 1, purpose: "checkup")
=> #<Appointment id: nil, date: "2017-04-18", start_time: "2017-04-18 14:29:13", length: 0.1e1, purpose: "checkup", doctor_id: nil, patient_id: 1, created_at: nil, updated_at: nil>
irb(main):008:0> a.doctor = d
=> #<Doctor id: 2, name: "Dr. Doctorface", specialty: "General Practice", created_at: "2017-04-18 18:22:19", updated_at: "2017-04-18 18:22:19">
irb(main):009:0> a
=> #<Appointment id: nil, date: "2017-04-18", start_time: "2017-04-18 14:29:13", length: 0.1e1, purpose: "checkup", doctor_id: 2, patient_id: 1, created_at: nil, updated_at: nil>
irb(main):010:0> a.save
   (0.3ms)  begin transaction
  SQL (1.2ms)  INSERT INTO "appointments" ("date", "start_time", "length", "purpose", "doctor_id", "patient_id", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?, ?, ?, ?)  [["date", Tue, 18 Apr 2017], ["start_time", 2017-04-18 18:29:13 UTC], ["length", 0.1e1], ["purpose", "checkup"], ["doctor_id", 2], ["patient_id", 1], ["created_at", 2017-04-18 18:30:14 UTC], ["updated_at", 2017-04-18 18:30:14 UTC]]
   (7.2ms)  commit transaction
=> true
irb(main):011:0>rb(main):001:0> d = Doctor.new(name: "Dr. Doctorface", specialty: "General Practice")
=> #<Doctor id: nil, name: "Dr. Doctorface", specialty: "General Practice", created_at: nil, updated_at: nil>
irb(main):002:0> d = Doctor.create(name: "Dr. Doctorface", specialty: "General Practice")
   (0.2ms)  begin transaction
  SQL (0.9ms)  INSERT INTO "doctors" ("name", "specialty", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["name", "Dr. Doctorface"], ["specialty", "General Practice"], ["created_at", 2017-04-18 18:22:19 UTC], ["updated_at", 2017-04-18 18:22:19 UTC]]
   (5.5ms)  commit transaction
=> #<Doctor id: 2, name: "Dr. Doctorface", specialty: "General Practice", created_at: "2017-04-18 18:22:19", updated_at: "2017-04-18 18:22:19">
irb(main):003:0> Patient.last
  Patient Load (0.4ms)  SELECT  "patients".* FROM "patients" ORDER BY "patients"."id" DESC LIMIT ?  [["LIMIT", 1]]
=> #<Patient id: 1, name: "Dummy McDumbface", age: 50, pcp_id: 1, created_at: "2017-04-18 18:09:23", updated_at: "2017-04-18 18:09:23">
irb(main):004:0> p = Patient.last
  Patient Load (0.3ms)  SELECT  "patients".* FROM "patients" ORDER BY "patients"."id" DESC LIMIT ?  [["LIMIT", 1]]
=> #<Patient id: 1, name: "Dummy McDumbface", age: 50, pcp_id: 1, created_at: "2017-04-18 18:09:23", updated_at: "2017-04-18 18:09:23">
irb(main):005:0> d
=> #<Doctor id: 2, name: "Dr. Doctorface", specialty: "General Practice", created_at: "2017-04-18 18:22:19", updated_at: "2017-04-18 18:22:19">
irb(main):006:0> a = p.appointments.build
DEPRECATION WARNING: Time columns will become time zone aware in Rails 5.1. This
still causes `String`s to be parsed as if they were in `Time.zone`,
and `Time`s to be converted to `Time.zone`.

To keep the old behavior, you must add the following to your initializer:

    config.active_record.time_zone_aware_types = [:datetime]

To silence this deprecation warning, add the following:

    config.active_record.time_zone_aware_types = [:datetime, :time]
 (called from irb_binding at (irb):6)
=> #<Appointment id: nil, date: nil, start_time: nil, length: nil, purpose: nil, doctor_id: nil, patient_id: 1, created_at: nil, updated_at: nil>
irb(main):007:0> a = p.appointments.build(start_time: Time.now, date: Time.now, length: 1, purpose: "checkup")
=> #<Appointment id: nil, date: "2017-04-18", start_time: "2017-04-18 14:29:13", length: 0.1e1, purpose: "checkup", doctor_id: nil, patient_id: 1, created_at: nil, updated_at: nil>
irb(main):008:0> a.doctor = d
=> #<Doctor id: 2, name: "Dr. Doctorface", specialty: "General Practice", created_at: "2017-04-18 18:22:19", updated_at: "2017-04-18 18:22:19">
irb(main):009:0> a
=> #<Appointment id: nil, date: "2017-04-18", start_time: "2017-04-18 14:29:13", length: 0.1e1, purpose: "checkup", doctor_id: 2, patient_id: 1, created_at: nil, updated_at: nil>
irb(main):010:0> a.save
   (0.3ms)  begin transaction
  SQL (1.2ms)  INSERT INTO "appointments" ("date", "start_time", "length", "purpose", "doctor_id", "patient_id", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?, ?, ?, ?)  [["date", Tue, 18 Apr 2017], ["start_time", 2017-04-18 18:29:13 UTC], ["length", 0.1e1], ["purpose", "checkup"], ["doctor_id", 2], ["patient_id", 1], ["created_at", 2017-04-18 18:30:14 UTC], ["updated_at", 2017-04-18 18:30:14 UTC]]
   (7.2ms)  commit transaction
=> true
irb(main):011:0>

```
