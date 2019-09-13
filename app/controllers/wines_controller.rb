class WinesController < ApplicationController
  def index
    if params[:name_filter] && params[:wine][:varietal] != "" && params[:wine][:varietal] != "All"
      @wines = Wine.by_varietal(params[:wine][:varietal])
      @varietal = params[:wine][:varietal]
    elsif params[:price_filter] && params[:wine][:price] != ""
      @wines = Wine.by_price(params[:wine][:price])
      @price_range = params[:wine][:price]
    elsif params[:search]
      @wines = Wine.by_search(params[:search])
    else
      @wines = Wine.all
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
