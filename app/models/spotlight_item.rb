class SpotlightItem < ActiveRecord::Base
  belongs_to :spotlight
  belongs_to :spotable, polymorphic: true

  image_attachment styles: { large: "800x400>", medium: "600x300>" }
end
