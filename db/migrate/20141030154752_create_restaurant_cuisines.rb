class CreateRestaurantCuisines < ActiveRecord::Migration
  def change
    create_table :restaurant_cuisines do |t|
      t.restaurant :references
      t.cuisine :references

      t.timestamps
    end
  end
end
