class CreateDishIngredients < ActiveRecord::Migration
  def change
    create_table :dish_ingredients do |t|
      t.references :dish, index: true
      t.references :ingredient, index: true

      t.timestamps
    end
  end
end
