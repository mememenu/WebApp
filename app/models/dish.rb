class Dish < ActiveRecord::Base
  belongs_to :category
  belongs_to :menu
  belongs_to :restaurant
  has_many :images, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow_destroy: true
  
  validates :name, presence: true
  validates :category_id, presence: true
  validates :menu_id, presence: true
  validates :restaurant_id, presence: true

  has_attached_file :avatar, :styles => { :large => "648x648>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment :avatar, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }

  after_save :cascade_hidden, :if => :hide_changed?

  def cascade_hidden
    self.images.each do |image|
      image.hide = self.hide
      image.save
    end
  end

end
