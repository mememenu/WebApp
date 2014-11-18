class Ingredient < ActiveRecord::Base

  belongs_to :restaurant
  belongs_to :dish

  validates :name, presence: true
  validates :restaurant_id, presence: true
  validates :dish_id, presence: true
end
