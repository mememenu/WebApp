class AddCloudFrontToRestaurantTile < ActiveRecord::Migration
  def change
    add_column :restaurant_tiles, :cloud_front, :string
  end
end
