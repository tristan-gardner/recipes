class RecipesController < ApplicationController
  def index
    do_redirect, view_prefs = update_settings(params, session)
    if do_redirect
      flash.keep
      redirect_to recipes_path(view_prefs) and return
    end

    @recipes = filter_and_sort view_prefs

    @calories = view_prefs["calories_filter"]
    @cuisine = view_prefs["cuisine_filter"]
  end

  def show

    id = params[:id]
    begin
      @recipe = Recipe.find(id)
      @similar = Recipe.most_similar_ingredients(@recipe)
      #byebug
      if user_signed_in?
        current_user.view_history += ":#{id}"
        current_user.save
      end
    rescue ActiveRecord::RecordNotFound => e
      redirect_to products_path
      return
    end
  end

  def new
  end

  def create
    begin
      r = Recipe.new(create_update_params)
      r.ingredient_raw_text.split(",").each do |ingredient_name|
        name = ingredient_name.gsub(/\s+/, "")
        if Ingredient.where("name = ?", name).size > 0
          ingredient = Ingredient.where("name = ?", name)[0]
        else
          ingredient = Ingredient.create!(name: name)
        end
        r.ingredients << ingredient
      end

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
      recipe.ingredients = []
      recipe.ingredient_raw_text.split(",").each do |ingredient_name|
        recipe.ingredients << Ingredient.create!(name: ingredient_name)
      end
      recipe.save
      flash[:notice] = "#{recipe.name} succesfully updated"
      redirect_to recipes_path
      return
    rescue
      flash[:warning] = "Unable to update #{recipe.name}"
      redirect_to edit_recipe_path
      return
    end
  end

  def destroy
      recipe = Recipe.find(params[:id])
      begin
          recipe.destroy
          flash[:notice] = "#{recipe.name} succesfully destroyed"
          redirect_to recipes_path
      rescue
          flash[:warning] = "Unable to destroy #{recipe.name}"
          redirect_to recipe_path
      end
  end

  private
  def create_update_params
    params.require(:recipe).permit(:name, :directions, :cuisine, :calories, :images, :user_id, :ingredient_raw_text)
  end

  def update_settings(parms, sess)
    preferences = sess[:preferences] || Hash.new
    if parms[:reset_filters] == "true"
      session.clear
      return true, Hash.new
    end
    should_redirect = false
    { "calories_filter" => "", "cuisine_filter" => ""}.each do |parm, default|
        parmval = parms[parm]
        if parmval.nil?  # not currently set; look at session
          parmval = preferences[parm] || default
          should_redirect = true
        elsif parmval != preferences[parm]  # is set, but is it different?
          should_redirect = true
        end
        preferences[parm] = parmval
    end

    sess[:preferences] = preferences
    return should_redirect, preferences
  end

  def filter_and_sort(view_prefs)
    constraints = {}
    calories = view_prefs["calories_filter"].to_i
    if calories > 0
      constraints[:calories] = calories
    end
    constraints[:cuisine] = view_prefs["cuisine_filter"]
    recipes = Recipe.filter_on_constraints(constraints)
    recipes
  end
end
