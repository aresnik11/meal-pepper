class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :type
      t.boolean :vegetarian
      t.string :url
      t.string :image_url
      t.integer :time
      t.boolean :cheap
      t.boolean :popular
      t.integer :servings

      t.timestamps
    end
  end
end
