class AddCuisineToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :cuisine, :string
  end
end
