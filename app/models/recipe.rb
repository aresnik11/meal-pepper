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

    def self.by_search(search, wanted_ings)
        Recipe.all.select do |recipe|
            recipe.has_any_of_these_ingreds?(wanted_ings) || recipe.found_in_title?(search)
        end
    end

    def self.titles
        Recipe.all.map do |recipe|
            recipe.title
        end
    end

    def self.not_unique_names
        not_unique = Recipe.all.select do |recipe|
            Recipe.titles.count(recipe.title) > 1
        end
        not_unique.map do |rec|
            rec.title
        end.uniq
    end

    # def delete_recipe
    #     self.ingredients.each do |ing|
    #         rec_ing = RecipeIngredient.find_by(recipe_id: self.id, ingredient_id: ing.id)
    #         rec_ing.delete
    #     end
    #     self.delete
    # end

end
