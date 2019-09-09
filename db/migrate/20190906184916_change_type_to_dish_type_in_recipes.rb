class ChangeTypeToDishTypeInRecipes < ActiveRecord::Migration[6.0]
  def change
    rename_column :recipes, :type, :dish_type
  end
end
