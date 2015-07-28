class Dish < ActiveRecord::Base
  belongs_to :category
  belongs_to :menu
  belongs_to :place
  has_many :additional_images, -> { where(default: nil) }, dependent: :destroy,
                               class_name: "Image", foreign_key: :dish_id,
                               inverse_of: :dish
  has_one :default_image, -> { where(default: true) }, dependent: :destroy,
                          class_name: "Image", inverse_of: :dish

  accepts_nested_attributes_for :additional_images, allow_destroy: true,
                                reject_if: proc { |attrs| attrs['avatar'].blank? }
  accepts_nested_attributes_for :default_image, allow_destroy: true

  # validates :name, presence: true
  validates :category_id, presence: true
  validates :menu_id, presence: true
  validates :place_id, presence: true

  after_save :cascade_hidden, :if => :hide_changed?

  def cascade_hidden
    additional_images.each do |image|
      image.hide = self.hide
      image.save
    end
  end
end
