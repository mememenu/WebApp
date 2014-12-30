json.array!(@restaurant_headers) do |restaurant_header|
  json.extract! restaurant_header, :id, :restaurant_id
  json.url restaurant_header_url(restaurant_header, format: :json)
end
