class RecipesController < ApplicationController
  def index
    @recipes = Recipes.all
  end

  def show
    id = params[:id]
    begin
      @recipe = Recipe.find(id)
    rescue ActiveRecord::RecordNotFound
      redirect_to products_path
      return
    end
  end

  def create
    begin
      r = Recipes.new(create_update_params)
      r.save
      flash[:notice] = "Recipe successfully added"
      redirect_to(recipes_path)
      return
    rescue
      flash[:warning] = "An error occurred, recipe not added"
      redirect_to(new_recipe_path)
      return
    end
  end

  private
  def create_update_params
    params.require(:recipe).permit(:name,:directions,:cuisine,:calories)
  end
end
