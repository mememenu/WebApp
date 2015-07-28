class RenameRestaurantFk < ActiveRecord::Migration
  def change
    rename_column :categories, :restaurant_id, :place_id
    rename_column :menus, :restaurant_id, :place_id
    rename_column :dishes, :restaurant_id, :place_id
    rename_column :tiles, :restaurant_id, :place_id
    rename_column :banners, :restaurant_id, :place_id
    rename_column :headers, :restaurant_id, :place_id
  end
end
