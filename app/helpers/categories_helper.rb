module CategoriesHelper
  def menu_value
    if @menu
      @menu.id
    else
      @category.menu.place.id
    end
  end

  def category_menu_id_default_value
    if @place
      @place.id
    else
      @category.place_id
    end
  end
end
