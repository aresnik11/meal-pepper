class RecipesController < ApplicationController
  def index
    if params[:filter] && params[:recipe][:dish_type] != "" && params[:recipe][:dish_type] != "All"
      @recipes = Recipe.by_dish_type(params[:recipe][:dish_type])
      @dish_type = params[:recipe][:dish_type]
    elsif params[:search]
      wanted_ings = Ingredient.search_ingreds(params[:search])
      @recipes = Recipe.by_search(params[:search], wanted_ings)
    else
      @recipes = Recipe.all
      @dish_type = "All"
    end
    @dish_types = Recipe.dish_types
    @count = @recipes.length
  end

  def show
    @recipe = Recipe.find(params[:id])
    @meal_plan_recipe = MealPlanRecipe.new
    @meal_plans = current_user.meal_plans
    @meal_plan = MealPlan.new
  end
end
