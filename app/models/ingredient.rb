class Ingredient < ApplicationRecord
    has_many :recipe_ingredients
    has_many :recipes, through: :recipe_ingredients

    # wanted_ings = Ingredient.where('name LIKE ?', "%#{params[:search]}%")

    def self.search_ingreds(term)
        Ingredient.where('name LIKE ?', "%#{term}%")
    end
end
