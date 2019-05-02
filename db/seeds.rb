# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Recipe.delete_all

#Users
cristian = User.create!(username: "Cristian", password: "password", email: "csaguil@colgate.edu")
tristan = User.create!(username: "Tristan", password: "password", email: "tgardner@colgate.edu")
matt = User.create!(username: "Matt", password: "password", email: "mwinters@colgate.edu")
john = User.create!(username: "John", password: "password", email: "jdonahue@colgate.edu")

#Ingredients
avocado = Ingredient.create!(name: "Avocado")
onion = Ingredient.create!(name: "Onion")
tomato = Ingredient.create!(name: "Tomato")
cilantro = Ingredient.create!(name: "Cilantro")
salt = Ingredient.create!(name: "Salt")
pepper = Ingredient.create!(name: "Pepper")
beef = Ingredient.create!(name: "Beef")
bread = Ingredient.create!(name: "Bread")
turkey = Ingredient.create!(name: "Turkey")
butter = Ingredient.create!(name: "Butter")
rice = Ingredient.create!(name: "Rice")
carrot = Ingredient.create!(name: "Carrot")
butter = Ingredient.create!(name: "Butter")
cheese = Ingredient.create!(name: "Cheese")
shrimp = Ingredient.create!(name: "Shrimp")
egg = Ingredient.create!(name: "Egg")

#Recipes

guac = Recipe.create!(name: "Guacamole", ingredient_raw_text: "Avocado,Onion,Cilantro,Salt", directions: "In a medium bowl, mash together the avocados, lime juice, and salt. Mix in onion, cilantro, tomatoes, and garlic. Stir in cayenne pepper. Refrigerate 1 hour for best flavor, or serve immediately.", cuisine: "Mexican", calories: 400, user_id: cristian.id)
guac_ingredients = [avocado, onion, cilantro, salt]
guac_ingredients.each do |ing|
  guac.ingredients << ing
end

pico = Recipe.create!(name: "Pico de Gallo", ingredient_raw_text: "Tomato,Onion,Cilantro,Salt", directions: "In a medium bowl, combine tomato, onion, jalapeno pepper (to taste,) cilantro and green onion. Season with garlic powder, salt and pepper. Stir until evenly distributed. Refrigerate for 30 minutes.", cuisine: "Mexican", calories: 120, user_id: cristian.id)
pico_ingredients = [onion, tomato, cilantro, salt]
pico_ingredients.each do |ing|
  pico.ingredients << ing
end

burg = Recipe.create!(name: "The Perfect Basic Burger", ingredient_raw_text: "Beef,Salt,Pepper,Bread", directions: "Preheat an outdoor grill for high heat and lightly oil grate. In a medium bowl, whisk together egg, salt and pepper. Place ground beef and bread crumbs into the mixture. With hands or a fork, mix until well blended. Form into 4 patties approximately 3/4 inch thick. Place patties on the prepared grill. Cover and cook 6 to 8 minutes per side, or to desired doneness.", cuisine: "American", calories: 650, user_id: john.id)
burg_ingredients = [beef, salt, pepper, bread]
burg_ingredients.each do |ing|
  burg.ingredients << ing
end

panini = Recipe.create!(name: "Turkey Avocado Panini", ingredient_raw_text: "Turkey,Avocado,Bread,Butter,Cheese", directions: "To make the sandwiches, split the ciabatta rolls in half the flat way, and brush the bottom of each roll with olive oil. Place the bottoms of the rolls onto the panini press, olive oil side down. Place a provolone cheese slice, half the spinach leaves, half the sliced turkey breast, and a sliced roasted red pepper on each sandwich. Spread half of the avocado mixture on the cut surface of each top, and place the top of the roll on the sandwich. Brush the top of the roll with olive oil. Close the panini press and cook until the bun is toasted and crisp, with golden brown grill marks, and the cheese has melted, about 5 to 8 minutes.", cuisine: "American", calories: 480, user_id: tristan.id)
panini_ingredients = [turkey, avocado, bread, butter, cheese]
panini_ingredients.each do |ing|
  panini.ingredients << ing
end

fried_rice = Recipe.create!(name: "Shrimp Fried Rice", ingredient_raw_text: "Rice,Onion,Egg,Carrot,Butter,Shrimp,Salt,Pepper", directions: "In a saucepan bring water to a boil. Add rice and stir. Reduce heat, cover and simmer for 20 minutes. Set aside and allow rice to cool. Heat a large skillet or wok for 2 minutes. When the skillet or wok is hot, pour in vegetable oil, bean sprouts and onions. Mix well and cook for 3 minutes. Mix in cooled rice and shrimp and cook for another 3 minutes. Stirring constantly. Mix in green onions, eggs, salt, pepper, soy sauce and sesame oil. Cook for another 4 minutes, stirring continuously, until eggs are cooked and everything is blended evenly.", cuisine: "Asian", calories: 350, user_id: matt.id)
fried_rice_ingredients = [rice, onion, egg, carrot, butter, shrimp, salt, pepper]
fried_rice_ingredients.each do |ing|
  fried_rice.ingredients << ing
end

review = Review.create!(description: "Wow, way too much salt! I think it could have been good with just a 1/2 tsp of salt. I even used 4 avocados instead of the three mentioned in recipe.", rating: 2, recipe_id: guac.id, user_id: tristan.id)
guac.reviews << review
