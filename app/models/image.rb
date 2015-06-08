class Image < ActiveRecord::Base
  belongs_to :dish

  validates :dish_id, presence: true

  has_attached_file :avatar, :styles => { :large => "700x700", :medium => "400x400>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment :avatar, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }
  before_save :create_cloudfront_url

  def create_cloudfront_url
    self.cloud_front = avatar.url.gsub('http://s3.amazonaws.com/meme-menu', 'http://dm7g4xbxa7ld3.cloudfront.net').gsub('original', 'large')
  end
end
