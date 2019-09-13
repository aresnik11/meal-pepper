class MealPlanRecipesController < ApplicationController
    def create
        @meal_plan_recipe = MealPlanRecipe.create(meal_plan_recipe_params)
        if @meal_plan_recipe.valid?
            @meal_plan = MealPlan.find(params[:meal_plan_recipe][:meal_plan_id])
            flash[:notice] = "Recipe successfully added"
            redirect_to user_meal_plan_path(current_user, @meal_plan)
        else
            flash[:messages] = @meal_plan_recipe.errors.full_messages
            @recipe = Recipe.find(params[:meal_plan_recipe][:recipe_id])
            redirect_to recipe_path(@recipe)
        end
    end

    def destroy
        meal_plan_recipe = MealPlanRecipe.find(params[:id])
        meal_plan = MealPlan.find(meal_plan_recipe.meal_plan_id)
        flash[:notice] = "Recipe successfully deleted"
        meal_plan_recipe.delete
        redirect_to user_meal_plan_path(current_user, meal_plan)
    end

    private

    def meal_plan_recipe_params
        params.require(:meal_plan_recipe).permit(:recipe_id, :meal_plan_id)
    end
end
