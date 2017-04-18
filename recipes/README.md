# Recipes

Question 2 from Bitmaker assignment April 18, 2017.

## Step 1:
This could be done with just Recipes and Ingredients, but Amounts is useful
information.

|recipes        |ingredients    |amounts   
|=======        |===========    |=======
|name           |name           |value
|description                    |unit
|instructions      
|servings
|calories


## Step 2:
Each Recipe can have many ingreients, and each Ingredient can belong to many
recipes. Each Recipe can also have many amounts of different ingredients, and each
Ingredient can have many amounts in different recipes. Each Amount can be used
for many ingredients, and can also be in many recipes.

However, this will not save much data, particularly if we store unit inside
ingredients instead. If we want to actually make many to many associations
between all three, we will need to use three extra join tables:
amounts_ingredients, amounts_recipes, and ingredients_recipes.

The best compromise is to move the unit data into ingredients, since most
ingredients are measured using only one unit. For a larger application,
instrcutions could become a model as well, to reduce repetition.

## Step 3:
Database schema

|recipes        |ingredients    |amounts   
|=======        |===========    |=======
|id             |id             |id
|name           |name           |value
|description    |unit           |recipe_id
|instructions                   |ingredient_id
|servings
|calories

## Step 4:
Generate the models
(See ./db and ./app/models)

## Step 5:
Create the associations
(see ./app/models)

## Checks:
``` Ruby

```
