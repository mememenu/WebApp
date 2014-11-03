json.array!(@dishes) do |dish|
  json.extract! dish, :id, :name, :description, :category, :category_display, :portion_size, :spice, :hot, :gluten_free, :vegetarian, :menu_id
  json.url dish_url(dish, format: :json)
end
