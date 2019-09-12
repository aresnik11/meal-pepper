class User < ApplicationRecord
    has_many :meal_plans
    has_secure_password
    validates :first_name, :last_name, :username, :email_address, presence: true
    validates :username, uniqueness: { case_sensitive: false }
    # validates :meal_plans.name, uniqueness: true

    def full_name
        self.first_name + " " + self.last_name
    end

    def delete_meal_plans
        self.meal_plans.each do |meal_plan|
          meal_plan.delete
        end
    end

    def ingredients_by_meal_plan
        meal_plan_recipe_ings = {}
        self.meal_plans.each do |meal_plan|
            name = meal_plan.name
            meal_plan_recipe_ings[name] = meal_plan.ingredient_names_by_recipe
        end
        meal_plan_recipe_ings
    end
end
