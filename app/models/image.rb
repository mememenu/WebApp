class Image < ActiveRecord::Base
  belongs_to :dish

  validates :dish_id, presence: true

  has_attached_file :avatar, :styles => { :large => "700x700", :medium => "400x400>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment :avatar, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }

end
