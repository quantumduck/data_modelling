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
irb(main):001:0> r = Recipe.create(name: "Dumb Cakes", description: "duh...", instructions: "Add ingredients; mix well; don't eat.", servings: 0, calories: 0)
   (0.1ms)  begin transaction
  SQL (0.5ms)  INSERT INTO "recipes" ("name", "description", "instructions", "servings", "calories", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?, ?, ?)  [["name", "Dumb Cakes"], ["description", "duh..."], ["instructions", "Add ingredients; mix well; don't eat."], ["servings", 0], ["calories", 0], ["created_at", 2017-04-18 17:16:40 UTC], ["updated_at", 2017-04-18 17:16:40 UTC]]
   (6.0ms)  commit transaction
=> #<Recipe id: 1, name: "Dumb Cakes", description: "duh...", instructions: "Add ingredients; mix well; don't eat.", servings: 0, calories: 0, created_at: "2017-04-18 17:16:40", updated_at: "2017-04-18 17:16:40">
irb(main):002:0> i1 = Ingredient.create(name: "dumbflour", unit: "cups")
   (0.2ms)  begin transaction
  SQL (0.8ms)  INSERT INTO "ingredients" ("name", "unit", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["name", "dumbflour"], ["unit", "cups"], ["created_at", 2017-04-18 17:19:25 UTC], ["updated_at", 2017-04-18 17:19:25 UTC]]
   (5.8ms)  commit transaction
=> #<Ingredient id: 1, name: "dumbflour", unit: "cups", created_at: "2017-04-18 17:19:25", updated_at: "2017-04-18 17:19:25">
irb(main):003:0> i2 = Ingredient.create(name: "dummypaste", unit: "tablespoons")
   (0.2ms)  begin transaction
  SQL (0.9ms)  INSERT INTO "ingredients" ("name", "unit", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["name", "dummypaste"], ["unit", "tablespoons"], ["created_at", 2017-04-18 17:19:57 UTC], ["updated_at", 2017-04-18 17:19:57 UTC]]
   (5.8ms)  commit transaction
=> #<Ingredient id: 2, name: "dummypaste", unit: "tablespoons", created_at: "2017-04-18 17:19:57", updated_at: "2017-04-18 17:19:57">
irb(main):004:0> a1 = i1.amounts.new(value: 2.5)
=> #<Amount id: nil, value: 0.25e1, recipe_id: nil, ingredient_id: 1, created_at: nil, updated_at: nil>
irb(main):005:0> r.amounts << a1
   (0.2ms)  begin transaction
  SQL (1.9ms)  INSERT INTO "amounts" ("value", "recipe_id", "ingredient_id", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?)  [["value", 0.25e1], ["recipe_id", 1], ["ingredient_id", 1], ["created_at", 2017-04-18 17:28:44 UTC], ["updated_at", 2017-04-18 17:28:44 UTC]]
   (4.5ms)  commit transaction
  Amount Load (0.4ms)  SELECT "amounts".* FROM "amounts" WHERE "amounts"."recipe_id" = ?  [["recipe_id", 1]]
=> #<ActiveRecord::Associations::CollectionProxy [#<Amount id: 1, value: 0.25e1, recipe_id: 1, ingredient_id: 1, created_at: "2017-04-18 17:28:44", updated_at: "2017-04-18 17:28:44">]>
irb(main):006:0> a2 = i2.amounts.new(value: 4)
=> #<Amount id: nil, value: 0.4e1, recipe_id: nil, ingredient_id: 2, created_at: nil, updated_at: nil>
irb(main):007:0> r.amounts << a2
   (0.2ms)  begin transaction
  SQL (0.9ms)  INSERT INTO "amounts" ("value", "recipe_id", "ingredient_id", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?)  [["value", 0.4e1], ["recipe_id", 1], ["ingredient_id", 2], ["created_at", 2017-04-18 17:29:34 UTC], ["updated_at", 2017-04-18 17:29:34 UTC]]
   (5.9ms)  commit transaction
=> #<ActiveRecord::Associations::CollectionProxy [#<Amount id: 1, value: 0.25e1, recipe_id: 1, ingredient_id: 1, created_at: "2017-04-18 17:28:44", updated_at: "2017-04-18 17:28:44">, #<Amount id: 2, value: 0.4e1, recipe_id: 1, ingredient_id: 2, created_at: "2017-04-18 17:29:34", updated_at: "2017-04-18 17:29:34">]>
irb(main):008:0> 


```
