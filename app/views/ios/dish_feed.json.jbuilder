json.array!(@dishes) do |dish|
  json.id dish.id
  json.name dish.name
  json.description dish.description
  json.avatar dish.default_image.try(:avatar)
  json.restaurant dish.place.name
  json.restaurant_avatar dish.place.avatar
  json.menu dish.menu.name
  json.category dish.category.name
  json.restaurant_zone dish.place.zone
  json.updated_at time_ago_in_words(dish.updated_at)
end

