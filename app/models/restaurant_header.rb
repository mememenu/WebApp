class RestaurantHeader < ActiveRecord::Base
  belongs_to :restaurant

  has_attached_file :avatar, :styles => { :large => "500x500>", :medium => "200x200>", :thumb => "100x100>" }, :default_url => "/images/placeholder_image1-1050x663.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment :avatar, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }

  validate :avatar, presence: true
end
