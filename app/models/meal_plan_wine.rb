class MealPlanWine < ApplicationRecord
  belongs_to :meal_plan
  belongs_to :wine
end
