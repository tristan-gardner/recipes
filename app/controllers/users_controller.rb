class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #byebug
    @recipes = @user.recipes

    #history implementation
    id_list = @user.view_history.split(":")
    @history = []
    seen = []
    id_list.each do |hist_id|
      if (!seen.include? hist_id) && (hist_id != "")
        seen << hist_id
        @history << Recipe.find_by_id(hist_id.to_i)
      end
    end
  end

  def destroy
    puts "here"
  end
end
