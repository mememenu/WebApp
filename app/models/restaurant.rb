class Restaurant < ActiveRecord::Base
  geocoded_by :full_address

  has_many :menus, dependent: :destroy
  has_many :dishes, dependent: :destroy
  has_many :categories
  has_one :restaurant_tile
  has_one :restaurant_header
  has_one :restaurant_banner
  belongs_to :owner, class_name: "User"

  accepts_nested_attributes_for :restaurant_tile, reject_if: proc { |attributes| attributes['avatar'].blank? }
  accepts_nested_attributes_for :restaurant_header, reject_if: proc { |attributes| attributes['avatar'].blank? }
  accepts_nested_attributes_for :restaurant_banner, reject_if: proc { |attributes| attributes['avatar'].blank? }

  before_save :generate_slug
  before_save :generate_clean_name
  before_save :create_google_maps_url
  before_save :check_for_delivery

  validates :name, presence: true, uniqueness: { scope: :city,
    message: "(A restaurant with this name already exists in this city)" }
  validates :address_1, presence: true
  validates :city, presence: true
  validates :state, presence: true, length: { is: 2}
  validates :zipcode, presence: true, numericality: true, length: { is: 5 }
  validates :phone, presence: true, numericality: true, length: { is: 10 }
  validates :zone, presence: true
  validates :foursquare_id, presence: true

  after_save :cascade_hidden, :if => :hide_changed?
  after_validation :geocode, if: :geolocate_address?

  has_attached_file :avatar, :styles => { :large => "500x500>", :medium => "200x200>", :thumb => "100x100>" }, :default_url => "/images/placeholder_image1-1050x663.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment :avatar, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }


  def check_for_delivery
    self.delivery_url = nil if delivery_url.blank?
  end

  def generate_clean_name
    if name.present?
      self.clean_name ||= name.gsub('The', '').split.join('')
    end
  end

  def create_google_maps_url
    formatted_address_1 = address_1.split.join('+')
    formatted_city = city.split.join('+') + "+" + state + "+" + zipcode
    self.maps_url ||= "https://www.google.com/maps/place/" + formatted_address_1 + ",+" + formatted_city
  end

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
    menus.each do |menu|
      menu.hide = hide
      menu.save
    end
  end

  def to_param
    slug
  end

  def generate_slug
    self.slug ||= name.parameterize if name.present?
  end

  def full_address
    [address_1, city, state, zipcode].compact.join(', ')
  end

  private

  def geolocate_address?
    full_address.present? &&
    (address_1_changed? || city_changed? || state_changed? || zipcode_changed?)
  end
end
