class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #byebug
    @recipes = @user.recipes

    #history implementation
    history = @user.view_history.split(":")
    @history = []
    seen = []
    history.each do |hist_id|
      if seen.include? hist_id
        seen << hist_id
        @history << Recipes.find(hist_id)
      end
    end
  end
end
