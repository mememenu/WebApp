module MenusHelper
  def default_value
    if @restaurant
      @restaurant.id
    else
      @menu.restaurant_id
    end
  end

  def restaurant_id_default_value
    if @restaurant
      @restaurant.id
    else
      @menu.restaurant_id
    end
  end
end
