# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Recipe.delete_all

user1 = User.create!(username: "csaguil", password: "password", email: "csaguil@colgate.edu")
user2 = User.create!(username: "tgardner", password: "password", email: "tgardner@colgate.edu")
recipe = Recipe.create!(name: "Guacamole", directions: "In a medium bowl, mash together the avocados, lime juice, and salt. Mix in onion, cilantro, tomatoes, and garlic. Stir in cayenne pepper. Refrigerate 1 hour for best flavor, or serve immediately.", cuisine: "Mexican", calories: 800, user_id: user1.id)
ingredients = ["Avocado", "Lime Juice", "Cilantro", "Onion", "Tomato", "Salts"]
ingredients.each do |ing|
  recipe.ingredients << Ingredient.create!(name: ing)
end
review = Review.create!(description: "Wow, way too much salt! I think it could have been good with just a 1/2 tsp of salt. I even used 4 avocados instead of the three mentioned in recipe.", rating: 2, recipe_id: recipe.id, user_id: user2.id)
recipe.reviews << review
