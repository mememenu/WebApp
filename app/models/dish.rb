class Dish < ActiveRecord::Base
  belongs_to :category, dependent: :destroy
  has_many :images

  validates :name, presence: true
  validates :portion_size, presence: true
  validates :spice, presence: true

end
