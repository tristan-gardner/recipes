require 'rails_helper'

Rspec.describe Recipe, type: :model do
  describe "check attributes and methods" do
    it "should be able to create an Recipe object which has the correct methods" do
      r = Recipe.create!(name: "Bacon Burger", description: "Blended up burger with bacon bits sprinkled on top")
      expect(r).to respond_to :name
      expect(r).to respond_to :description
    end
  end
end
