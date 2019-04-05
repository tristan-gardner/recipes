require 'rails_helper'

RSpec.describe RecipesController do
  describe "INDEX" do
    it "has a 200 response code" do
      get :index
      assert_response 200
    end
    it "should render the index view displaying created recipes" do
      get :index
      assert_response 200
      expect(response).to render_template('index')
    end
  end

  describe "SHOW PAGE" do
    before(:each) do
      @r = Recipe.create!(id:1, name:"Dumpster Burger", directions: "Youd oudwn")
    end
    it "has a 200 response code" do
      get :show(:id => @r.id)
      assert_response 200
    end
    it "should display an object when accessing it's show page" do
      get :show(:id => @r.id)
    end
    it "should redirect to the index when attempting to access an item that does not exist" do
      get :show
      assert_response 302
      expect(response).to redirect_to(index)
    end
    it "should display a button to edit a recipe" do
    end
    it "should display an objects title, description and vote counts" do
    end
  end

  describe "CREATE PAGE" do
    before(:each) do
      visit :new_recipe_path
    end
    it "should redirect to the index when parameters are filled in correctly" do
      fill_in 'Name', with: "Cheezy Burger"
      fill_in 'Directions', with: "Damn just fry up those buns in some bacon grease, toss some avacados in the mix and you get a litty burger"
      fill_in 'Cuisine', with: "Hell if I know"
      fill_in 'Calories', with: 2000
      expect(response).to redirect_to(index)
    end
    it "should redirect to the new page when the fields are not filled in properly" do
      fill_in 'Directions', with: "Damn just fry up those buns in some bacon grease, toss some avacados in the mix and you get a litty burger"
      fill_in 'Cuisine', with: "Hell if I know"
      fill_in 'Calories', with: 2000
      expect(response).to redirect_to(new)
    end
  end
  describe "UDPATE ID" do
    before(:each) do
      r = Recipe.create!(id: 50, name: "Bacony Burgers", description: "Totally Burgerlicous!")
      get :update, r
    end
    it "should properly update a model object" do
      fill_in "Name", with: "Baconery Burgers"
      fill_in "Description", with: "Awful food"
      fill_in "Cuisine", with: "American"
      fill_in "Calories", with: 100000
      click_button "Update Recipe"
      expect(r.name).to eq("Baconery Burgers")
      expect(r.description).to eq("Awful food")
      expect(r.cuisine).to eq("American")
      expect(r.calories).to eq(100000)
    end
    it "should redirect to the index page following a proper update" do
      fill_in "Name", with: "Burgery Bacon"
      click_button "Update Recipe"
      expect(response).to render_template('index')
    end
    it "should remain on the update page when improper values are given" do
      fill_in "Name", with: 123
      click_button "Update Recipe"
      expect(response).to render_template('update')
    end

    it "should not update an objects values when new values are invalid" do
      fill_in "Name", with: 123
      click_button "Update Recipe"
      expect(r.name).to eq("Bacony Burger")
    end
    it "should not update an objects values when no new values are given" do
      click_button "Update Recipe"
      expect(r.name).to eq("Bacony Burger")
    end
  end
end
