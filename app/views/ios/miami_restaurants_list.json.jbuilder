json.array!(@restaurants) do |restaurant|
  json.partial! 'ios/base_restaurant', restaurant: restaurant
  json.slug restaurant.slug
  json.cloud_front restaurant.restaurant_tile.try(:cloud_front)
  json.maps_url restaurant.maps_url
  json.delivery_url restaurant.delivery_url
  json.foursquare_id restaurant.foursquare_id
  json.status restaurant.status
  json.restaurant_banner restaurant.restaurant_banner.try(:avatar)
  json.lat restaurant.latitude
  json.long restaurant.longitude
end
