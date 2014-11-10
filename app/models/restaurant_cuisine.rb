class RestaurantCuisine < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :cuisine

  validates :cuisine_id, presence: true
  validates :restaurant_id, presence: true
end
