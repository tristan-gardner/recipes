require 'rails_helper'

Rspec.describe Recipe, type: :model do
  describe "check attributes and methods" do
    it "should be able to create an Recipe object which has the correct methods" do
      r = Recipe.create!(name: "Bacon Burger", directions: "Blended up burger with bacon bits sprinkled on top",calories: 2000, cuisine: "Druggie Lunch")
      expect(r).to respond_to :name
      expect(r).to respond_to :directions
      expect(r).to respond_to :calories
      expect(r).to respond_to :cuisine
    end
    it "should fail to be created when a name is not supplied" do
      expect {
        r = Recipe.create!(directions: "Blended up burger with bacon bits sprinkled on top")}.to raise_exception ActiveRecord::NotNullException
    end
    it "should be created when directions are not supplied but a name is" do
      r = Recipe.create!(name: "Bacon Burger", directions: "Blended up burger with bacon bits sprinkled on top")
    end
  end
end
