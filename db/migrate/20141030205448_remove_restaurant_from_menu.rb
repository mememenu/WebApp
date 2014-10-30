class RemoveRestaurantFromMenu < ActiveRecord::Migration
  def change
    remove_column :menus, :restaurant_id, :integer
  end
end
