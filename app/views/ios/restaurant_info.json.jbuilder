json.array!(@restaurants) do |restaurant|
  json.name restaurant.name
  json.avatar restaurant.avatar
  json.restaurant_header restaurant.restaurant_header.avatar
  json.ios_tile restaurant.restaurant_tile.avatar
  json.address_1 restaurant.address_1
  json.address_2 restaurant.address_2
  json.city restaurant.city
  json.state restaurant.state
  json.zipcode restaurant.zipcode
  json.phone restaurant.phone
  json.zone restaurant.zone
  json.monday_hours restaurant.monday_hours
  json.tuesday_hours restaurant.tuesday_hours
  json.wednesday_hours restaurant.wednesday_hours
  json.thursday_hours restaurant.thursday_hours
  json.friday_hours restaurant.friday_hours
  json.saturday_hours restaurant.saturday_hours
  json.sunday_hours restaurant.sunday_hours
end