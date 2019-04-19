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
  end
end
