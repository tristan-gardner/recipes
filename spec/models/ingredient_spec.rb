require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "object creation" do
    it "should be able to create an Ingredient object with all the right attributes and methods" do
      i = Ingredient.create!(name: "cheese")
      expect(i).to respond_to :name
    end
    it "should fail if a name is not given" do
      expect {
        Ingredient.create!()}.to raise_error(ActiveRecord::NotNullViolation)
    end
  end
end
