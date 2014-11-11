module CategoriesHelper

  def menu_value
    if @menu 
      @menu.id
    else
      @category.menu.restaurant.id
    end
  end

end
