class Category < ActiveRecord::Base
  belongs_to :menu
  belongs_to :place
  has_many :dishes, dependent: :destroy

  validates :name, presence: true
  validates :menu_id, presence: true
  validates :place_id, presence: true
  validates :priority, presence: true, uniqueness: { scope: :menu_id,
  message: "(Another Category with this priority already exists.)" }

  after_save :cascade_hidden, :if => :hide_changed?
  scope :unhidden, -> { where(hide: [nil, false]) }

  def cascade_hidden
    self.dishes.each do |dish|
      dish.hide = self.hide
      dish.save
    end
  end

  def clean_name
    self.name.gsub(/[ &]/, '')
  end

end
