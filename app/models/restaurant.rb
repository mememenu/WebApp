class Restaurant < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { scope: :city,
    message: "(A restaurant with this name already exists in this city)" }
  validates :address_1, presence: true
  validates :city, presence: true
  validates :state, presence: true, length: { is: 2}
  validates :zipcode, presence: true, numericality: true, length: { is: 5 }
  validates :phone, presence: true, numericality: true, length: { is: 10 }
  # validates :cuisine_ids, presence: true

  has_many :cuisines, through: :restaurant_cuisines
  has_many :restaurant_cuisines, dependent: :destroy

  has_many :menus, through: :restaurant_menus
  has_many :restaurant_menus, dependent: :destroy

  has_attached_file :avatar, :styles => { :large => "500x500>", :medium => "250x250>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment :avatar, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }
end


