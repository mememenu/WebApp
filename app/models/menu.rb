class Menu < ActiveRecord::Base

  validates :name, presence: true

  has_many :restaurants, through: :restaurant_menus
  has_many :restaurant_menus, dependent: :destroy
  has_many :categories, dependent: :destroy

  after_save :cascade_hidden, :if => :hide_changed?


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

end
