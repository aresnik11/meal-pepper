class MealPlanRecipe < ApplicationRecord
  belongs_to :recipe
  belongs_to :meal_plan
end
