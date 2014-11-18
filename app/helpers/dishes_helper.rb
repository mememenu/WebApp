module DishesHelper

  def category_id_value
    if @category
      @category.id
    else
      @dish.category_id
    end
  end

  def restaurant_menu_options
    menu_options = []
    @restaurant.menus.each do |menu|
      menu_options<<[menu.name, menu.id]
    end
    menu_options
  end

end
