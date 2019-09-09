class MealPlansController < ApplicationController
  before_action :find_meal_plan, only: [:show, :edit, :update, :destroy]

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
      redirect_to meal_plan_path(@meal_plan)
    else
      flash[:messages] = @meal_plan.errors.full_messages
      redirect_to new_meal_plan_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_meal_plan
    @meal_plan = MealPlan.find(params[:id])
  end

  def meal_plan_params
    params.require(:meal_plan).permit(:name, :user_id)
  end
end
