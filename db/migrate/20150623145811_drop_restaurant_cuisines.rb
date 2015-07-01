class DropRestaurantCuisines < ActiveRecord::Migration
  def change
    drop_table :restaurant_cuisines
  end
end
