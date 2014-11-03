class Dish < ActiveRecord::Base
  belongs_to :menu

  has_many :categories, through: :dish_categories
  has_many :dish_categories, dependent: :destroy

  validates :name, presence: true
  validates :portion_size, presence: true
  validates :spice, presence: true

end
