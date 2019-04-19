class ReviewsController < ApplicationController
  def new
    puts params
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

  def index
    @reviews = Review.where("recipe_id = #{params[:recipe_id]}")
  end

  private
  def create_update_params
    params.require(:review).permit(:description, :rating, :user_id, :recipe_id)
  end
end
