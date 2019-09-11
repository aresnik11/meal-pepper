class CreateWines < ActiveRecord::Migration[6.0]
  def change
    create_table :wines do |t|
      t.string :title
      t.float :rating
      t.string :description
      t.string :image_url
      t.string :price
      t.string :varietal

      t.timestamps
    end
  end
end
