class Spotlight < ActiveRecord::Base
  has_many :spotlight_items
  belongs_to :home_page
end
