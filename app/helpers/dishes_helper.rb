module DishesHelper
  def category_id_value
    if @category
      @category.id
    else
      @dish.category_id
    end
  end
end
