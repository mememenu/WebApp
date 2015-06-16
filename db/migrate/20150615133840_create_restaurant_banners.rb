class CreateRestaurantBanners < ActiveRecord::Migration
  def change
    create_table :restaurant_banners do |t|
      t.timestamps
    end
  end
end
