class ReviewsController < ApplicationController
  def new
    puts "----------------------------"
    puts params
    puts "----------------------------"
    puts "----------------------------"
    puts "----------------------------"
    puts "----------------------------"
  end

  def create
    begin
      r = Review.new(create_update_params)
      r.save
      flash[:notice] = "Review successfully added"

    rescue
      flash[:warning] = "An error occurred, review not added"
    end
    redirect_to(recipe_path(Recipe.find(params["review"]["recipe_id"].to_i)))
    return
  end

  private
  def create_update_params
    params.require(:review).permit(:description, :rating, :user_id, :recipe_id)
  end
end
