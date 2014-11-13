module ApplicationHelper
  def cuisine_finder
    finder = []

    Cuisine.all.each do |cuisine|
      unless cuisine.restaurants.empty?
        finder<<cuisine
      end
    end
    
    finder
  end

  def restaurant_dropdown_options
    Restaurant.where(hide: [nil, false])
  end

end
