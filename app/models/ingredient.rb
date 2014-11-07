class Ingredient < ActiveRecord::Base
  has_many :dishes, through: :dish_ingredients
  has_many :dish_ingredients, dependent: :destroy
  belongs_to :restaurant


  validates :name, presence: true, uniqueness: { scope: :restaurant, 
    message: "This Ingredient already exists at this restaurant" }
end
