module IngredientsHelper

  def restaurant_options
    restaurants = []

    Restaurant.all.each do |restaurant|
      restaurants << [restaurant.name, restaurant.id]
    end

    restaurants
  end

  def default_restaurant
    if @ingredient.restaurant_id
      @ingredient.restaurant_id
    else
      1
    end
  end

end
