class CreateRestaurantTiles < ActiveRecord::Migration
  def change
    create_table :restaurant_tiles do |t|
      t.references :restaurant, index: true

      t.timestamps
    end
  end
end
