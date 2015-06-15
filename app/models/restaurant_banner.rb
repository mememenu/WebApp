class RestaurantBanner < ActiveRecord::Base
  belongs_to :restaurant

  has_attached_file :avatar,
    :styles => {
      :large => { geometry:  "750x280>" },
      :medium => "500x188>",
      :thumb => "375x140>",
    },
    :default_url => "https://s3.amazonaws.com/meme-menu/missing_small.jpg"
  validates_attachment_content_type :avatar, :content_type => ["image/jpeg", "image/png", "image/gif"]
  validate :minimum_avatar_dimension

  private

  def minimum_avatar_dimension
    if avatar.queued_for_write[:original].present?
      geometry = Paperclip::Geometry.from_file(avatar.queued_for_write[:original].path)
      if geometry.width < 750 || geometry.height < 280
        errors.add(:avatar_dimension, 'is too small.')
      end
    end
  end
end
