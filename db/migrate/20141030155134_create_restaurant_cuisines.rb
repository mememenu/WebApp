class CreateRestaurantCuisines < ActiveRecord::Migration
  def change
    create_table :restaurant_cuisines do |t|
      t.references :restaurant, index: true
      t.references :cuisine, index: true

      t.timestamps
    end
  end
end
