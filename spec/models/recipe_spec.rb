require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before :each do
    @user = User.create!(:username => "user1", :email => "user1@user.com", :password => "password")
  end
  it "should be able to create an Recipe object which has the correct methods" do
    r = Recipe.create!(name: "Bacon Burger", directions: "Blended up burger with bacon bits sprinkled on top",calories: 2000, cuisine: "Druggie Lunch", user_id: @user.id)
    expect(r).to respond_to :name
    expect(r).to respond_to :directions
    expect(r).to respond_to :calories
    expect(r).to respond_to :cuisine
  end
  it "should fail to be created when a name is not supplied" do
    expect {
      r = Recipe.create!(directions: "Blended up burger with bacon bits sprinkled on top", user_id: @user.id)}.to raise_error(ActiveRecord::NotNullViolation)
  end
  it "should be created when directions are not supplied but a name is" do
    r = Recipe.create!(name: "Bacon Burger", directions: "Blended up burger with bacon bits sprinkled on top", user_id: @user.id)
  end
end
