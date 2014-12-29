json.array!(@restaurant_tiles) do |restaurant_tile|
  json.extract! restaurant_tile, :id, :restaurant_id
  json.url restaurant_tile_url(restaurant_tile, format: :json)
end
