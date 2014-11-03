class Category < ActiveRecord::Base
  belongs_to :menu, dependent: :destroy
  has_many :dishes

  validates :name, presence: true


end
