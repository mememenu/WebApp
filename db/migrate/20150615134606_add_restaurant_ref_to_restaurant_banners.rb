class AddRestaurantRefToRestaurantBanners < ActiveRecord::Migration
  def change
    add_reference :restaurant_banners, :restaurant, index: true
  end
end
