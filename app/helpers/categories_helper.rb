module CategoriesHelper
  def menu_value
    if @menu
      @menu.id
    else
      @category.menu.restaurant.id
    end
  end

  def category_menu_id_default_value
    if @restaurant
      @restaurant.id
    else
      @category.restaurant_id
    end
  end
end
