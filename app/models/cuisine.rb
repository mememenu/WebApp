class Cuisine < ActiveRecord::Base
  has_many :restaurants, through: :restaurant_cuisines
  has_many :restaurant_cuisines, dependent: :destroy
end
