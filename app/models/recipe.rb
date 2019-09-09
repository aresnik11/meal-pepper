class Recipe < ApplicationRecord
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    has_many :meal_plan_recipes
    has_many :meal_plans, through: :meal_plan_recipes

    def self.dish_types
        dish_types_array = Recipe.all.map do |recipe|
            recipe.dish_type
        end.uniq
        dish_types_array << "All"
    end

    def self.by_dish_type(dish_type)
        Recipe.all.select do |recipe|
            recipe.dish_type == dish_type
        end
    end

    def self.count_of_dish_type(dish_type)
        self.by_dish_type(dish_type).count
    end

    def ingredient_names
        self.ingredients.map do |ing|
            ing.name.downcase
        end
    end

    def found_in_title?(search)
        self.title.downcase.include?(search.downcase)
    end

    def has_any_of_these_ingreds?(ingred_array)
        self.ingredients.any? do |ing|
            ingred_array.include?(ing)
        end
    end

end
