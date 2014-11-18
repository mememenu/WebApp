class Menu < ActiveRecord::Base

  validates :name, presence: true
  validates :restaurant_id, presence: true

  belongs_to :restaurant
  has_many :categories, dependent: :destroy
  has_many :dishes

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

  def clean_name
    self.name.gsub(/[ &]/, '')
  end

end
