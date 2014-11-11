class AddRestaurantToMenu < ActiveRecord::Migration
  def change
    add_reference :menus, :restaurant, index: true
  end
end
