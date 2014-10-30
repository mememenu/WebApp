class Menu < ActiveRecord::Base
  belongs_to :restaurant
  validates :restaurant_id, presence: true
  validates :name, presence: true
  validates :display_name, presence: true
end
