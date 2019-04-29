require 'rails_helper'
require 'simplecov'

SimpleCov.start


RSpec.describe Recipe, type: :model do
  before(:each) do
    user = User.where("username = user")
  end
  describe "check attributes and methods" do
    it "should be able to create an Recipe object which has the correct methods" do
      r = Recipe.new(name: "Bacon Burger", directions: "Blended up burger with bacon bits sprinkled on top",calories: 2000, cuisine: "Druggie Lunch")
      r.user = user
      r.save!
      expect(r).to respond_to :name
      expect(r).to respond_to :directions
      expect(r).to respond_to :calories
      expect(r).to respond_to :cuisine
      expect(r).to respond_to :user
    end
    it "should fail to be created when a name is not supplied" do
      expect {
        r = Recipe.create!(directions: "Blended up burger with bacon bits sprinkled on top")}.to raise_error(ActiveRecord::NotNullViolation)
    end
    it "should be created when directions are not supplied but a name is" do
      r = Recipe.new(name: "Bacon Burger", directions: "Blended up burger with bacon bits sprinkled on top")
      r.user = user
      r.save
      expect(r).not_to eq(nil)
    end

    it "should return recipe with most common ingredients when calling the most_similar_ingredients method" do
      milk = Ingredient.create!(name: "Milk")
      sugar = Ingredient.create!(name: "Sugar")
      ice = Ingredient.create!(name: "Ice")
      chocolate = Ingredient.create!(name: "chocolate")
      strawberry = Ingredient.create!(name: "strawberry")
      bun = Ingredient.create!(name: "bun")
      meat = Ingredient.create!(name: "meat")

      author = User.create!(username: "t", email: "t@t.com", password: "password")

      r1 = Recipe.new(name: "Strawberry Milkshake")
      r1.user = author
      r1.ingredients << [milk,sugar,ice,strawberry]
      r1.save

      r2 = Recipe.new(name: "Chocolate Milkshake")
      r2.user = author
      r2.ingredients << [milk, sugar, ice, chocolate]
      r2.save

      r3 = Recipe.new(name: "Bacon Burger")
      r3.user = author
      r3.ingredients << [bun, meat]
      r3.save

      expect(Recipe.most_similar_ingredients(r1)).to eq(r2)
      expect(Recipe.most_similar_ingredients(r2)).to eq(r1)
      expect(Recipe.most_similar_ingredients(r3)).to eq(nil)
    end
  end
end
