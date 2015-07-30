class Image < ActiveRecord::Base
  belongs_to :dish

  has_attached_file :avatar,
    :styles => {
      :large => "648x648>",
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
  validates :dish, presence: true
  after_save :create_cloudfront_url
  before_save :clean_cloudfront_url

  private

  def clean_cloudfront_url
    if avatar.dirty?
      self.cloudfront_url = nil
    end
  end

  def create_cloudfront_url
    if cloudfront_url.nil?
      self.cloudfront_url = avatar.url.gsub(
        "http://s3.amazonaws.com/#{avatar.bucket_name}",
        "http://#{Rails.configuration.cloudfront_subdomain}.cloudfront.net"
      ).gsub('original', 'large')
      save
    end
  end

  def minimum_avatar_dimension
    if avatar.queued_for_write[:original].present?
      geometry = Paperclip::Geometry.from_file(avatar.queued_for_write[:original].path)
      if geometry.width < 648 || geometry.height < 648
        errors.add(:avatar_dimension, 'is too small.')
      end
    end
  end
end
