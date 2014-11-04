class Category < ActiveRecord::Base
  belongs_to :menu
  has_many :dishes, dependent: :destroy

  validates :name, presence: true
  validates :menu_id, presence: true


end
