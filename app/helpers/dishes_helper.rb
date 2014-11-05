module DishesHelper

  def dish_value
    if @category
      @category.id
    else
      @dish.category_id
    end
  end

end
