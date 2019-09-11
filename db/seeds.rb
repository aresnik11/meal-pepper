require 'rest-client'
require 'json'
require 'dotenv/load'

APIKEY = ENV['SPOONACULAR_API_KEY']

# RecipeIngredient.destroy_all
# Recipe.destroy_all
# Ingredient.destroy_all

# SEED RECIPE & INGREDIENTS

# snack_response_string = RestClient.get("https://api.spoonacular.com/recipes/complexSearch?number=10&addRecipeInformation=true&fillIngredients=true&type=snack&offset=40&apiKey=#{APIKEY}")
# snack_response_hash = JSON.parse(snack_response_string)

# snack_response_hash["results"].each do |recipe|
#     #build recipe
#     title = recipe["title"]
#     vegetarian = recipe["vegetarian"]
#     url = recipe["sourceUrl"]
#     image = recipe["image"]
#     time = recipe["readyInMinutes"]
#     cheap = recipe["cheap"]
#     popular = recipe["veryPopular"]
#     servings = recipe["servings"]
#     cuisine = recipe["cuisines"].join(", ")
#     new_recipe = Recipe.find_or_create_by!(title: title, dish_type: "Snack", vegetarian: vegetarian, url: url, image_url: image, time: time, cheap: cheap, popular: popular, servings: servings, cuisine: cuisine)

#     #build ingredients and recipe ingredients from analyzed instructions
#     if !recipe["analyzedInstructions"].empty?
#         recipe["analyzedInstructions"][0]["steps"].each do |step|
#             if !step["ingredients"].empty?
#                 step["ingredients"].each do |ing|
#                     new_ing = Ingredient.find_or_create_by!(name: ing["name"].downcase)
#                     RecipeIngredient.find_or_create_by!(ingredient_id: new_ing.id, recipe_id: new_recipe.id)
#                 end
#             end
#         end
#     end
    
#     #build ingredients and recipe ingredients from missed ingredients
#     if !recipe["missedIngredients"].empty?
#         recipe["missedIngredients"].each do |ingr|
#             new_ingr = Ingredient.find_or_create_by!(name: ingr["name"].downcase)
#             RecipeIngredient.find_or_create_by!(ingredient_id: new_ingr.id, recipe_id: new_recipe.id)
#         end
#     end
# end


# SEED WINES

# wine_response_string = RestClient.get("https://api.spoonacular.com/food/wine/recommendation?wine=champagne&number=3&apiKey=#{APIKEY}")
# wine_response_hash = JSON.parse(wine_response_string)

# wine_response_hash["recommendedWines"].each do |wine|
#     title = wine["title"]
#     description = wine["description"]
#     price = wine["price"]
#     rating = wine["averageRating"]
#     image_url = wine["imageUrl"]
#     varietal = "Champagne"
#     Wine.find_or_create_by!(title: title, description: description, price: price, rating: rating, image_url: image_url, varietal: varietal)
# end

byebug

puts "done seeding"