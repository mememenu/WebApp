class CreateRestaurantMenus < ActiveRecord::Migration
  def change
    create_table :restaurant_menus do |t|
      t.references :restaurant, index: true
      t.references :menu, index: true

      t.timestamps
    end
  end
end
