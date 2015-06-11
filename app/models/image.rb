class Image < ActiveRecord::Base
  belongs_to :dish

  validates :dish_id, presence: true

  has_attached_file :avatar,
    :styles => {
      :large => "648x648",
      :medium => "400x400>",
      :thumb => "100x100>",
      :watermark => {
        processors: [:watermark],
        geometry:  "648x648>",
        watermark_path: "#{Rails.root}/app/assets/images/logo.png",
        auto_orient:    false
      }
    },
    :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: ["image/jpeg", "image/png"]
  validate :minimum_avatar_dimension
  before_save :create_cloudfront_url

  def create_cloudfront_url
    self.cloudfront_url = avatar.url.gsub('http://s3.amazonaws.com/meme-menu', 'http://dm7g4xbxa7ld3.cloudfront.net').gsub('original', 'large')
  end

  private

  def minimum_avatar_dimension
    if avatar.queued_for_write[:original].present?
      geometry = Paperclip::Geometry.from_file(avatar.queued_for_write[:original].path)
      if geometry.width < 700 || geometry.height < 700
        errors.add(:avatar_dimension, 'is too small.')
      end
    end
  end
end
