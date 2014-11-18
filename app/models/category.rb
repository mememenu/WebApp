class Category < ActiveRecord::Base
  belongs_to :menu
  belongs_to :restaurant
  has_many :dishes, dependent: :destroy

  validates :name, presence: true
  validates :menu_id, presence: true
  validates :restaurant_id, presence: true

  after_save :cascade_hidden, :if => :hide_changed?


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
