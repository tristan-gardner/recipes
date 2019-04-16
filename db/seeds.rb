# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Recipe.delete_all

user = User.create!(username: "user", password: "password", email: "user@mail.com")
recipe = Recipe.create!(name: "Pizza", directions: "make a pizza", cuisine: "Italian", calories: 800, user: user)
ingredient = Ingredient.create!(name: "cheese")
recipe.ingredients << ingredient
