class Recipe < ApplicationRecord
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    has_many :meal_plan_recipes
    has_many :meal_plans, through: :meal_plan_recipes
end
