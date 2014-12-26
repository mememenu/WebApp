json.array!(@dishes) do |dish|
  json.id dish.id
  json.name dish.name
  json.description dish.description
  json.avatar dish.avatar
  json.restaurant dish.restaurant.name
  json.restaurant_avatar dish.restaurant.avatar
  json.menu dish.menu.name
  json.category dish.category.name
  json.restautant_zone dish.restaurant.zone
  json.updated_at time_ago_in_words(dish.updated_at)
end

