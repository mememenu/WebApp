module CategoriesHelper

  def menu_value
    if @menu 
      @menu.id
    else
      @category.menu.restaurants.first.id
    end
  end
end
