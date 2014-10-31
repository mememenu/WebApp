module MenusHelper

  def restaurant_selectors
  
    selectors = []
  
    Restaurant.all.each do |restaurant| 
      selectors<<[restaurant.name, restaurant.id] 
    end 
  
    selectors

  end

end
