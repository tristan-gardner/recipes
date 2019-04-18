require 'rails_helper'

RSpec.describe "index page", type: :feature do
  #let(:title_sort) {["abhorrent", "gorgeous", "lovely", "stinky"]}
  let(:calories_sort) {["Latkas", "Chicken Adobo", "Pizza", "Lasagna"]}
  let(:cuisine_sort) {["Filipino", "italian", "Italian", "Jewish"]}
  #let(:distance_sort) {["abhorrent", "gorgeous", "stinky", "lovely"]}

  before :each do
    user = User.create!(:username => "user1", :email => "user1@user.com", :password => "password")
    Recipe.create!(name: "Pizza", directions: "make a pizza", cuisine: "Italian", calories: 800, user_id: user.id)
    Recipe.create!(name: "Lasagna", directions: "Kind of like layered pasta", cuisine: "italian", calories: 1000, user_id: user.id)
    Recipe.create!(name: "Chicken Adobo", directions: "Saguil's famous dish", cuisine: "Filipino", calories: 400, user_id: user.id)
    Recipe.create!(name: "Latkas", directions: "Round hash browns", cuisine: "Jewish", calories: 200, user_id: user.id)

    visit "/recipes"
  end


  it "should do the correct filtering when filtering by calories" do
    fill_in "Maximum Calories", :with => "800"
    click_button "Filter"
    visit "/recipes"
    names = []
    page.all(".title").each { |x| names << x.text }
    expect(names.length).to eq(3)
    visit "/recipes"
    names = []
    page.all(".title").each { |x| names << x.text }
    expect(names.length).to eq(3)
    visit "/recipes"
    click_link "Clear filters"
    names = []
    page.all(".title").each { |x| names << x.text }
    expect(names.length).to eq(4)
  end

  it "should do the correct filtering when filtering by cuisine" do
    fill_in "Cuisine Type", :with => "italian"
    click_button "Filter"
    visit "/recipes"
    names = []
    page.all(".title").each { |x| names << x.text }
    expect(names.length).to eq(2)
    visit "/recipes"
    names = []
    page.all(".title").each { |x| names << x.text }
    expect(names.length).to eq(2)
    fill_in "Cuisine Type", :with => "Filipino"
    click_button "Filter"
    names = []
    page.all(".title").each { |x| names << x.text }
    expect(names.length).to eq(1)
    click_link "Clear filter"
    names = []
    page.all(".title").each { |x| names << x.text }
    expect(names.length).to eq(4)
  end

  it "should do the correct filtering when filtering by calories and cuisine" do
    fill_in "Cuisine Type", :with => "italian"
    fill_in "Maximum Calories", :with => "800"
    click_button "Filter"
    visit "/recipes"
    names = []
    page.all(".title").each { |x| names << x.text }
    expect(names.length).to eq(1)
    visit "/recipes"
    names = []
    page.all(".title").each { |x| names << x.text }
    expect(names.length).to eq(1)
    click_link "Clear filter"
    names = []
    page.all(".title").each { |x| names << x.text }
    expect(names.length).to eq(4)
  end




  it "should have a link to create a recipe" do
    expect(page).to have_link("Create New Recipe")
  end
end
