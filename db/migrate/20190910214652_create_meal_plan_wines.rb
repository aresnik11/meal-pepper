class CreateMealPlanWines < ActiveRecord::Migration[6.0]
  def change
    create_table :meal_plan_wines do |t|
      t.belongs_to :meal_plan, null: false, foreign_key: true
      t.belongs_to :wine, null: false, foreign_key: true

      t.timestamps
    end
  end
end
