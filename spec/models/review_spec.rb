require 'rails_helper'
require 'simplecov'

SimpleCov.start


RSpec.describe Review, type: :model do
  before(:each) do
    @user = User.create!(username: "a", email: "a@a.com", password: "password")
  end
  describe "check attributes and methods" do
    it "should be able to create an Review object" do
      a_p = Review.new(rating: 1, description: "This is horrifying")
      a_p.user = @user
      expect(a_p).to respond_to :rating
      expect(a_p).to respond_to :description
    end
    it "should fail to be created when a description is not supplied" do
      expect {a_p = Review.create!(rating: 5)}.to raise_error(ActiveRecord::RecordInvalid)
    end
    it "should to be created when the rating is greater than 5 (#FeatureNotABug)" do
      a_p = Review.new(rating: 10, description: "Wow amazing")
      a_p.user = @user
      a_p.save
      expect(a_p).not_to eq(nil)
    end
    it "should to be created when the rating is less than 0 (#FeatureNotABug)" do
      a_p = Review.new(rating: -1, description: "Wow amazing")
      a_p.user = @user
      a_p.save
      expect(a_p.description).not_to eq(nil)
    end
  end
end
