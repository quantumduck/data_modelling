# Gythub

Question 5 from Bitmaker assignment April 18, 2017.

## Step 1:
We can get away with only the name field in the repository. If we wanted to
implement an MVP, we would need to at least have a path to the repository files
on the server, although this is not very secure.

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


```
