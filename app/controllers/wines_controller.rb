class WinesController < ApplicationController
  def index
    if params[:name_filter] && params[:wine][:varietal] != "" && params[:wine][:varietal] != "All"
      @wines = Wine.by_varietal(params[:wine][:varietal]).shuffle
      @varietal = params[:wine][:varietal]
    elsif params[:price_filter] && params[:wine][:price] != ""
      @wines = Wine.by_price(params[:wine][:price]).shuffle
      @price_range = params[:wine][:price]
    elsif params[:search]
      @wines = Wine.by_search(params[:search]).shuffle
    else
      @wines = Wine.all.shuffle
      @varietal = "All"
    end
    @varietals = Wine.varietals
    @prices = Wine.prices
    @count = @wines.length
  end

  def show
    @wine = Wine.find(params[:id])
    @meal_plan_wine = MealPlanWine.new
    @meal_plans = current_user.meal_plans
    @meal_plan = MealPlan.new
  end
end
