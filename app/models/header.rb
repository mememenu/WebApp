class Header < ActiveRecord::Base
  belongs_to :place

  image_attachment styles: { large: "500x500>", medium: "200x200>", thumb: "100x100>" }
end
