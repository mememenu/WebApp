class RestaurantBanner < ActiveRecord::Base
  belongs_to :restaurant

  has_attached_file :avatar,
    :styles => {
      :large => { geometry:  "750x280>" },
      :medium => "500x188>",
      :thumb => "375x140>",
    },
    :default_url => "https://s3.amazonaws.com/meme-menu/missing_small.jpg"
  validates_attachment_content_type :avatar, :content_type => ["image/jpeg", "image/png"]
end
