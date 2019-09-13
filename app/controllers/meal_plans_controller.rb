class MealPlansController < ApplicationController
  before_action :find_meal_plan, only: [:show, :edit, :update, :destroy]
  before_action :limit_view, only: [:show, :edit, :update, :destroy]

  def index
    @meal_plans = MealPlan.all
  end

  def show
  end

  def new
    @meal_plan = MealPlan.new
  end

  def create

    @meal_plan = MealPlan.create(meal_plan_params)
    if @meal_plan.valid?
      if params[:meal_plan][:recipe_id]
        MealPlanRecipe.create(recipe_id: params[:meal_plan][:recipe_id], meal_plan_id: @meal_plan.id)
      elsif params[:meal_plan][:wine_id]
        MealPlanWine.create(wine_id: params[:meal_plan][:wine_id], meal_plan_id: @meal_plan.id)
      end
      flash[:notice] = "Meal plan successfully created"
      redirect_to user_meal_plan_path(current_user, @meal_plan)
    else
      flash[:messages] = @meal_plan.errors.full_messages
      redirect_to new_user_meal_plan_path(current_user)
    end
  end

  def edit
  end

  def update
    if @meal_plan.update(meal_plan_params)
      flash[:notice] = "Meal plan successfully updated"
      redirect_to user_meal_plan_path(current_user, @meal_plan)
    else
      flash[:messages] = @meal_plan.errors.full_messages
      redirect_to edit_user_meal_plan_path(current_user, @meal_plan)
    end
  end

  def destroy
    @meal_plan.delete_recipes
    @meal_plan.delete_wines
    @meal_plan.delete
    flash[:notice] = "Meal plan successfully deleted"
    redirect_to user_path(current_user)
  end

  private

  def limit_view
    meal_plan = MealPlan.find(params[:id])
    if current_user.id != params[:user_id].to_i || !current_user.meal_plans.include?(meal_plan)
      flash[:messages] = ["You don't have access to that meal plan"]
      redirect_to user_path(current_user)
    end
  end

  def find_meal_plan
    @meal_plan = MealPlan.find(params[:id])
  end

  def meal_plan_params
    params.require(:meal_plan).permit(:name, :user_id)
  end
end
