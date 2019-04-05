require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "check attributes and methods" do
    it "should be able to create an Review object" do
      a_p = Review.create!(rating: 1, description: "This is horrifying")
      expect(a_p).to respond_to :rating
      expect(a_p).to respond_to :description
    end
    it "should fail to be created when a rating is not supplied" do
      expect {a_p = Review.create!(description: "This is horrifying")}.to raise_exception ActiveRecord::NotNullException
    end
    it "should fail to be created when a description is not supplied" do
      expect {a_p = Review.create!(rating: 5)}.to raise_exception ActiveRecord::NotNullException
    end
    it "should fail to be created when the rating is greater than 5" do
      a_p = Review.create(rating: 10, description: "Wow amazing")
      expect( a_p).to eq(nil)
    end
    it "should fail to be created when the rating is less than 0" do
      a_p = Review.create(rating: -1, description: "Wow amazing")
      expect( a_p).to eq(nil)
    end
  end
end
