class RemoveImageUrlFromIngredients < ActiveRecord::Migration[6.0]
  def change

    remove_column :ingredients, :image_url, :string
  end
end
