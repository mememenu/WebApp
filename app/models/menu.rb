class Menu < ActiveRecord::Base

  validates :name, presence: true
  validates :place_id, presence: true
  validates :priority, presence: true, uniqueness: { scope: :place_id,
  message: "(Another Menu with this priority already exists.)" }

  belongs_to :place
  has_many :categories, dependent: :destroy
  has_many :dishes

  after_save :cascade_hidden, :if => :hide_changed?
  scope :unhidden, -> { where(hide: [nil, false]) }

  def cascade_hidden
    self.categories.each do |category|
      category.hide = self.hide
      category.save
    end
  end

  #returns an array of all category ID's associated with that menu
  def menu_categories

    categories = []

    self.categories.each do |category|
        categories<<category.id
      end

    categories

  end

  def clean_name
    self.name.gsub(/[ &]/, '')
  end

end
