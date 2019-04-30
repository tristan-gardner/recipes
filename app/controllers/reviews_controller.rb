class ReviewsController < ApplicationController
  def new
    puts params
  end

  def index
    @reviews = Review.where("recipe_id = #{params[:recipe_id]}")
  end

  def create
    @recipe = Recipe.find(params[:id])
    @review = Review.create(review_params)
    @review.user = current_user
    @recipe.reviews << @review

    respond_to do |format|
      format.html do
        # existing code that renders or redirects.
        flash[:notice] = "You reviewed #{@recipe.name}"
        redirect_to recipe_path(@recipe) and return
      end
      format.json do
        # new code that handles responding to an AJAX call with some
        # JSON.
        puts "AJAX --------------------------"
        render json: { description: @review.description, rating: @review.rating, user: @review.user.username}, :status => :ok
      end
    end
  end

  private
  def review_params
    params.require(:review).permit(:description, :rating, :user_id, :recipe_id)
  end
end
