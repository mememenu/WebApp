json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :name, :address_1, :address_2, :city, :state, :zipcode, :phone, :zone
  json.url restaurant_url(restaurant, format: :json)
end