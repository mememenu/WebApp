json.array!(@places) do |place|
  json.partial! 'ios/base_place', place: place
  json.slug place.slug
  json.cloud_front place.tile.try(:cloud_front)
  json.maps_url place.maps_url
  json.delivery_url place.delivery_url
  json.foursquare_id place.foursquare_id
  json.status place.status
  json.restaurant_banner place.banner.try(:avatar)
  json.lat place.latitude
  json.long place.longitude
end
