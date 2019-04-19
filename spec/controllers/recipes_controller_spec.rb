require 'rails_helper'
require 'simplecov'

SimpleCov.start

RSpec.describe RecipesController do
  describe "INDEX" do
    it "has a 302 response code" do #redirects to the params
      get :index
      assert_response 302
    end
    it "should render the index view displaying created recipes with an empty params hash" do
      get :index
      assert_response 302
      expect(response).to render_template('index')
    end
  end
end
