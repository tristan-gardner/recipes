require 'rails_helper'

Rspec.describe Review, type: :model do
  describe "check attributes and methods" do
    it "should be able to create an Review object" do
      a_p = Review.create!(:rating 1, description: "This is horrifying")
      expect(a_p).to respond_to :rating
      expect(a_p).to respond_to :description
    end
  end
end
