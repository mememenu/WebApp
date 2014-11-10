class RestaurantMenu < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :menu

  validates :restaurant_id, presence: true
  validates :menu_id, presence: true
end
