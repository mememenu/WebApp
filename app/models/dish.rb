class Dish < ActiveRecord::Base
  belongs_to :category
  has_many :images, dependent: :destroy

  validates :name, presence: true
  validates :portion_size, presence: true
  validates :spice, presence: true

  has_attached_file :avatar, :styles => { :large => "500x500>", :medium => "250x250>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment :avatar, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }

end
