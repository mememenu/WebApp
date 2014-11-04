module CategoriesHelper

  def default_value
    if @menu 
      @menu.id
    else
      nil
    end
  end

end
