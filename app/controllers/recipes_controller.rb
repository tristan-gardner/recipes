class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
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

  def new
  end

  def create
    begin
      r = Recipe.new(create_update_params)
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

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    recipe = Recipe.find(params[:id])
    begin
      recipe.update(create_update_params)
      flash[:notice] = "#{recipe.name} succesfully updated"
      redirect_to recipes_path
      return
    rescue
      flash[:warning] = "Unable to update #{recipe.name}"
      redirect_to edit_recipe_path
      return
    end
  end

  private
  def create_update_params
    params.require(:recipe).permit(:name, :directions, :cuisine, :calories, :images)
  end
end
