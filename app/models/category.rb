class Category < ActiveRecord::Base
  belongs_to :menu
  has_many :dishes, dependent: :destroy

  validates :name, presence: true
  validates :menu_id, presence: true

  after_save :cascade_hidden, :if => :hide_changed?


  def cascade_hidden
    self.dishes.each do |dish|
      dish.hide = self.hide
      dish.save
    end
  end

end
