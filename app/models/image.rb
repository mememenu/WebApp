class Image < ActiveRecord::Base
  belongs_to :dish

  image_attachment styles: {
    :large => "648x648>",
    :medium => "300x300>",
    :thumb => "100x100>",
    :watermark => {
      processors: [:watermark],
      geometry:  "648x648>",
      watermark_path: "#{Rails.root}/app/assets/images/logo.png",
      auto_orient:    false
    }
  }

  validates :dish, presence: true
end
