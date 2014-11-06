module MenusHelper

 def default_value
  if @restaurant
    @restaurant.id    
  else
    #same as @menu.restaurant_id
    @menu.restaurants.first.id
  end

 end

end
