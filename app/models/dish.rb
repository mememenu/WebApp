class Dish < ActiveRecord::Base
  belongs_to :category
  belongs_to :menu
  belongs_to :restaurant
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: proc { |attrs| attrs['avatar'].blank? }

  # validates :name, presence: true
  validates :category_id, presence: true
  validates :menu_id, presence: true
  validates :restaurant_id, presence: true

  has_attached_file :avatar,
    :styles => {
      :large => { geometry:  "648x648>" },
      :medium => "300x300>",
      :thumb => "100x100>",
      :watermark => {
        processors: [:watermark],
        geometry:  "648x648>",
        watermark_path: "#{Rails.root}/app/assets/images/logo.png",
        auto_orient:    false
      }
    },
    :default_url => "https://s3.amazonaws.com/meme-menu/missing_small.jpg"
  validates_attachment_content_type :avatar, content_type: ["image/jpeg", "image/png"]

  validate :minimum_avatar_dimension
  before_save :create_cloudfront_url
  after_save :cascade_hidden, :if => :hide_changed?

  def create_cloudfront_url
    self.cloud_front = self.avatar.url.gsub('http://s3.amazonaws.com/meme-menu', 'http://dm7g4xbxa7ld3.cloudfront.net').gsub('original', 'large')
  end

  def cascade_hidden
    self.images.each do |image|
      image.hide = self.hide
      image.save
    end
  end

  private

  def minimum_avatar_dimension
    if avatar.queued_for_write[:original].present?
      geometry = Paperclip::Geometry.from_file(avatar.queued_for_write[:original].path)
      if geometry.width < 648 || geometry.height < 648
        errors.add(:avatar_dimension, 'is too small.')
      end
    end
  end
end
