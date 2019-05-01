require 'rails_helper'
require 'simplecov'

SimpleCov.start


RSpec.describe User, type: :model do


  it "should be able to add a user" do
    user = User.create!(:username => "m1", :email => "m1@user.com", :password => "password")
    users = User.all
    expect(users.length).to eq(1)
  end

  it "should not be able to add a user if the email or username is taken" do
    User.create(:username => "m1", :email => "m1@user.com", :password => "password")
    User.create(:username => "m2", :email => "m1@user.com", :password => "password")
    users = User.all
    expect(users.length).to eq(1)
    User.create(:username => "m1", :email => "m2@user.com", :password => "password")
    expect(users.length).to eq(1)
  end

  it "should be able to save reviews to user" do
    user = User.create!(:username => "m1", :email => "m1@user.com", :password => "password")
    rec = Recipe.create!(name: "Pizza", directions: "make a pizza", cuisine: "Italian", calories: 800, user_id: user.id)
    r1 = Review.create!(:description => "twas good", :rating => 5, :recipe_id => rec.id, :user_id => user.id)
    user.reviews << r1
    expect(user.reviews.length).to eq(1)
    r2 = Review.create!(:description => "twas bad", :rating => 1, :recipe_id => rec.id, :user_id => user.id)
    user.reviews << r2
    expect(user.reviews.length).to eq(2)
  end

  it "should be able to save recipes to users" do
    user = User.create!(:username => "m1", :email => "m1@user.com", :password => "password")
    rec = Recipe.create!(name: "Pizza", directions: "make a pizza", cuisine: "Italian", calories: 800, user_id: user.id)
    user.recipes << rec
    expect(user.recipes.length).to eq(1)
  end
end
