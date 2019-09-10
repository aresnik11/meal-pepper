class MealPlan < ApplicationRecord
  belongs_to :user
  has_many :meal_plan_recipes
  has_many :recipes, through: :meal_plan_recipes

  validates :name, presence: true
  validate :meal_plan_names_for_user

  def delete_recipes
    self.meal_plan_recipes.each do |meal_recipe|
      meal_recipe.delete
    end
  end

  def meal_plan_names_for_user    
    meal_plan_names = self.user.meal_plans.map do |meal_plan|
      meal_plan.name
    end
    if meal_plan_names.include?(name)
      errors.add(:name, "already exists")
    end
  end
end
