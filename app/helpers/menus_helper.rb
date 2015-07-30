module MenusHelper
  def default_value
    if @place
      @place.id
    else
      @menu.place_id
    end
  end

  def place_id_default_value
    if @place
      @place.id
    else
      @menu.place_id
    end
  end
end
