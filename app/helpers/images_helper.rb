module ImagesHelper
  def dish_value
    if @dish
      @dish.id
    else
      @image.dish_id
    end
  end
end
