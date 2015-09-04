class Tile < ActiveRecord::Base
  belongs_to :place

  image_attachment styles: { thumb: "100x100>", large: "648x648>" }
end
