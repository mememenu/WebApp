class Tile < ActiveRecord::Base
  belongs_to :place

  has_attached_file :avatar,
    :styles => {
      :thumb => "100x100>",
      :large => "648x648#"
    },
    :default_url => "/images/placeholder_image1-1050x663.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment :avatar, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }

  after_save :create_cloud_front

  def create_cloud_front
    if cloud_front.nil?
      self.cloud_front = avatar.url.gsub(
        "http://s3.amazonaws.com/#{avatar.bucket_name}",
        "http://#{Rails.configuration.cloudfront_subdomain}.cloudfront.net"
      ).gsub('original', 'large')
      save
    end
  end
end
