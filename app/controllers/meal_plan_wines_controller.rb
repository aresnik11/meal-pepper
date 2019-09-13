class MealPlanWinesController < ApplicationController
    def create
        @meal_plan_wine = MealPlanWine.create(meal_plan_wine_params)
        if @meal_plan_wine.valid?
            @meal_plan = MealPlan.find(params[:meal_plan_wine][:meal_plan_id])
            flash[:notice] = "Wine successfully added"
            redirect_to user_meal_plan_path(current_user, @meal_plan)
        else
            flash[:messages] = @meal_plan_wine.errors.full_messages
            @wine = Wine.find(params[:meal_plan_wine][:wine_id])
            redirect_to wine_path(@wine)
        end
    end

    def destroy
        meal_plan_wine = MealPlanWine.find(params[:id])
        meal_plan = MealPlan.find(meal_plan_wine.meal_plan_id)
        flash[:notice] = "Wine successfully deleted"
        meal_plan_wine.delete
        redirect_to user_meal_plan_path(current_user, meal_plan)
    end

    private

    def meal_plan_wine_params
        params.require(:meal_plan_wine).permit(:meal_plan_id, :wine_id)
    end
end
