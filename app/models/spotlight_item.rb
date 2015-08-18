class SpotlightItem < ActiveRecord::Base
  belongs_to :spotlight
  belongs_to :spotable, polymorphic: true

  has_attached_file :avatar, styles: { large: "800x400>", medium: "600x300>" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment :avatar, :content_type => { :content_type => ["image/jpeg", "image/png"] }
end
