class RenameRestaurants < ActiveRecord::Migration
  def change
    rename_table :restaurants, :places
    rename_table :restaurant_tiles, :tiles
    rename_table :restaurant_banners, :banners
    rename_table :restaurant_headers, :headers
  end
end
