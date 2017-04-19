# YMDB

Question 7 from Bitmaker assignment April 18, 2017.

## Step 1:
We are asked to use three objects:

|films          |directors      |actors
|=======        |============   |======
|name           |name           |name
|year           |bio            |bio
|description    |birth          |birth
                |death          |death

## Step 2:
Each movie has one director and can have many actors. Each director can director
many movies and work with many actors. Each actor can be in many films and can
work with many directors.

## Step 3:
Database schema.

|films          |directors      |actors  |actors_films
|=======        |============   |======  |============
|id             |id             |id      |actor_id
|name           |name           |name    |film_id
|year           |bio            |bio
|description    |birth          |birth
|director_id    |death          |death

## Step 4:
Generate the models
(See ./db and ./app/models)

## Step 5:
Create the associations
(see ./app/models)

## Checks:
``` Ruby




```
