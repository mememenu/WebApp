class CreateRestaurantHeaders < ActiveRecord::Migration
  def change
    create_table :restaurant_headers do |t|
      t.references :restaurant, index: true

      t.timestamps
    end
  end
end
