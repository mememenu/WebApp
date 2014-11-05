module CategoriesHelper

  def menu_value
    if @menu 
      @menu.id
    else
      nil
    end
  end
end
