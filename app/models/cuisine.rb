class Cuisine < ActiveRecord::Base
  has_many :restaurants, through: :restaurant_cuisine
end
