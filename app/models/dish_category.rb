class DishCategory < ActiveRecord::Base
  belongs_to :category
  belongs_to :dish
end
