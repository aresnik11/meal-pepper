class MealPlan < ApplicationRecord
  belongs_to :user
  has_many :meal_plan_recipes
  has_many :recipes, through: :meal_plan_recipes
  has_many :meal_plan_wines
  has_many :wines, through: :meal_plan_wines

  validates :name, presence: true
  validate :meal_plan_names_for_user

  def delete_recipes
    self.meal_plan_recipes.each do |meal_recipe|
      meal_recipe.delete
    end
  end

  def delete_wines
    self.meal_plan_wines.each do |meal_wine|
      meal_wine.delete
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

  def ingredient_names_by_recipe
    rec_ings = {}
    self.recipes.each do |rec|
      title = rec.title
      rec_ings[title] = rec.ingredient_names
    end
    self.wines.each do |wine|
      title = wine.title
      rec_ings[title] = []
    end
    rec_ings
  end
end
