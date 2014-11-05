module MenusHelper

  # def restaurant_selectors
  
  #   selectors = []
  
  #   Restaurant.all.each do |restaurant| 
  #     selectors<<[restaurant.name, restaurant.id] 
  #   end 
  
  #   selectors

  # end

  # def default_restaurant_selector
  #   if @menu.restaurants.first
  #     @menu.restaurants.first.id
  #   else
  #     1
  #   end
  # end

 def default_value
  if @edit
    #same as @menu.restaurant_id
    @menu.restaurants.first.id
  elsif @restaurant
    @restaurant.id
  else
    
  end
 end

end
