class Menu < ActiveRecord::Base

  validates :name, presence: true

  has_many :restaurants, through: :restaurant_menus
  has_many :restaurant_menus, dependent: :destroy
  has_many :categories, dependent: :destroy

end
