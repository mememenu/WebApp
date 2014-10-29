class Restaurant < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { scope: :address_1,
    message: "only one restaurant with this name can have this address" }
  validates :address_1, presence: true
  validates :city, presence: true
  validates :state, presence: true, length: { is: 2}
  validates :zipcode, presence: true, numericality: true, length: { is: 5 }
  validates :phone, presence: true, numericality: true, length: { is: 10 }
end
