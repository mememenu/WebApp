class CreateDishCategories < ActiveRecord::Migration
  def change
    create_table :dish_categories do |t|
      t.references :category, index: true
      t.references :dish, index: true

      t.timestamps
    end
  end
end
