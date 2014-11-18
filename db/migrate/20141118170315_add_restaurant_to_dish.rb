class AddRestaurantToDish < ActiveRecord::Migration
  def change
    add_reference :dishes, :restaurant, index: true
  end
end
