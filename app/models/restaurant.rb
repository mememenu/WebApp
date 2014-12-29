class Restaurant < ActiveRecord::Base
  has_many :cuisines, through: :restaurant_cuisines
  has_many :restaurant_cuisines, dependent: :destroy
  has_many :menus, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :dishes
  has_many :categories
  has_one :restaurant_tile

  accepts_nested_attributes_for :restaurant_tile, reject_if: proc { |attributes| attributes['avatar'].blank? }

  before_validation :generate_slug

  validates :name, presence: true, uniqueness: { scope: :city,
    message: "(A restaurant with this name already exists in this city)" }
  validates :address_1, presence: true
  validates :city, presence: true
  validates :state, presence: true, length: { is: 2}
  validates :zipcode, presence: true, numericality: true, length: { is: 5 }
  validates :phone, presence: true, numericality: true, length: { is: 10 }
  validates :slug, uniqueness: true, presence: true
  validates :zone, presence: true

  after_save :cascade_hidden, :if => :hide_changed?

  has_attached_file :avatar, :styles => { :large => "500x500>", :medium => "200x200>", :thumb => "100x100>" }, :default_url => "/images/placeholder_image1-1050x663.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment :avatar, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }

  
  #returns an array of all category ID's associated with that restaurant
  def restaurant_categories
    menus = []

    self.menus.each do |menu|
      menus<<menu
    end

    categories = []

    menus.each do |menu|
      menu.categories.each do |category|
        categories<<category.id
      end
    end

    categories
  end

  def cascade_hidden

    self.menus.each do |menu|
      menu.hide = self.hide
      menu.save
    end
  end

  def to_param
    slug
  end

  def generate_slug
    self.slug ||= name.parameterize
  end

end






