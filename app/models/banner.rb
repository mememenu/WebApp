class Banner < ActiveRecord::Base
  belongs_to :place

  image_attachment styles: {
    :large => "750x280>",
    :medium => "500x188>",
    :thumb => "375x140>",
  }
end
