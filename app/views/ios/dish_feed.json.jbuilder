json.array!(@dishes) do |dish|
  json.id dish.id
  json.name dish.name
  json.description dish.description
  json.avatar dish.avatar
  json.restaurant dish.restaurant.name
  json.restaurant_avatar dish.restaurant.avatar
  json.menu dish.menu.name
  json.category dish.category.name
end

