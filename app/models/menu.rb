class Menu < ActiveRecord::Base

  validates :name, presence: true

  has_many :restaurants, through: :restaurant_menus
  has_many :restaurant_menus, dependent: :destroy
  has_many :categories, dependent: :destroy


  #returns an array of all category ID's associated with that menu
  def menu_categories

    categories = []

    self.categories.each do |category|
        categories<<category.id
      end

    categories

  end

end
