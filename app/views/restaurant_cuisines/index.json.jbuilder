json.array!(@restaurant_cuisines) do |restaurant_cuisine|
  json.extract! restaurant_cuisine, :id, :restaurant_id, :cuisine_id
  json.url restaurant_cuisine_url(restaurant_cuisine, format: :json)
end
