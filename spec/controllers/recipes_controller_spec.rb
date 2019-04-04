Rspec.describe RecipeController do
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
      r = Recipe.create!(name: "Dumpster Burger", directions: "You woudn't believe me if I told you", author: "JFS"))
    end
    it "has a 200 response code" do
      get :show, :id 1
      assert_response 200
    end
    it "should display an object when accessing it's show page" do
      get :show, :id 1
    end
    it "should redirect to the index when attempting to access an item that does not exist" do
      get :show, :id 100000000
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
  describe "UDPATE PAGE" do
    before(:each) do
      r = Recipe.create!(name: "Bacon Burger", directions: "Blended up burger with bacon bits sprinkled on top", author: "JFS", calories: 2000, cuisine: "Druggie Lunch")
    end
    after(:each) do
      r.destroy
    end
    it "should properly update a model object"do
    end
    it "should redirect to the index page following a proper update" do
    end
    it "should remain on the update page when improper values are given" do
    end
    it "should not update an objects values when new values are invalid" do
    end
    it "should not update an objects values when no new values are given" do
    end
  end
end
