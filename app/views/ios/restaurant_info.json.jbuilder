json.array!(@restaurants) do |restaurant|
  json.name restaurant.name
  json.avatar restaurant.avatar
  json.ios_tile restaurant.restaurant_tile.avatar
  json.address_1 restaurant.address_1
  json.address_2 restaurant.address_2
  json.city restaurant.city
  json.state restaurant.state
  json.zipcode restaurant.zipcode
  json.phone restaurant.phone
  json.zone restaurant.zone
end