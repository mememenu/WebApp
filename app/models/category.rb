class Category < ActiveRecord::Base
  has_many :dishes, through: :dish_categories
  has_many :dish_categories, dependent: :destroy

  validates :name, presence: true


end
