class Ingredient < ApplicationRecord
    has_many :recipe_ingredients
    has_many :recipes, through: :recipe_ingredients

    def self.search_ingreds(term)
        Ingredient.where('name LIKE ?', "%#{term}%")
    end
end
