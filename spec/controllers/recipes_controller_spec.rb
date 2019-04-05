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
end
