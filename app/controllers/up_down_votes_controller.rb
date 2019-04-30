class UpDownVotesController < ApplicationController
  before_action :authenticate_user!

  def upvote
    recipe = Recipe.find(params[:id])
    if !recipe.hasUpvoter?(current_user)
      if recipe.hasDownvoter?(current_user)
        recipe.removeVote(current_user)
      end
      dovote(true)
    end
  end

  def downvote
    recipe = Recipe.find(params[:id])
    if !recipe.hasDownvoter?(current_user)
      if recipe.hasUpvoter?(current_user)
        recipe.removeVote(current_user)
      end
      dovote(false)
    end
  end

private
  def dovote(updown)
    begin
      @recipe = Recipe.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "No such recipe"
      redirect_to recipes_path and return
    end
    if @recipe.users.include?(current_user)
      return
    end
    @recipe.up_down_votes.create(:upvote => updown, :user => current_user)
    respond_to do |format|
      format.html do
        # existing code that renders or redirects.
        flash[:notice] = "You #{updown ? "upvoted" : "downvoted"} #{@recipe.name}"
        redirect_to recipe_path(@recipe) and return
      end
      format.json do
        # new code that handles responding to an AJAX call with some
        # JSON.
        render json: { up: @recipe.upvotes, down: @recipe.downvotes }, :status => :ok
      end
    end
  end
end
