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

  def add_review
    begin
      recipe = Recipe.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "No such recipe"
      redirect_to recipes_path and return
    end
    puts params
    review = recipe.reviews.create(create_update_params)
    respond_to do |format|
      format.html do
        # existing code that renders or redirects.
        flash[:notice] = "You reviewed #{recipe.name}"
        redirect_to recipe_path(recipe) and return
      end
      format.json do
        # new code that handles responding to an AJAX call with some
        # JSON.
        puts "kjfhlaskdjfhlskdjh"
        render json: { review: review  }, :status => :ok
      end
    end
  end

  private
  def create_update_params
    params.require(:review).permit(:description, :rating, :user_id, :recipe_id)
  end
end
