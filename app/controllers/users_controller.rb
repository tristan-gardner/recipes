class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #byebug
    @recipes = @user.recipes
  end
end
