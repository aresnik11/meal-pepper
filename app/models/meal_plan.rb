class MealPlan < ApplicationRecord
  belongs_to :user
  has_many :meal_plan_recipes
  has_many :recipes, through: :meal_plan_recipes
end
