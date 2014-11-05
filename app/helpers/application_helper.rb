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
end
