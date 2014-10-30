class Menu < ActiveRecord::Base

  validates :name, presence: true
  validates :display_name, presence: true

  has_many :restaurants, through: :restaurant_menus
  has_many :restaurant_menus, dependent: :destroy

end
