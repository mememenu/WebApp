json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :address_1, :address_2, :city, :state, :zipcode, :description, :phone, :dollars, :reservations
  json.url restaurant_url(restaurant, format: :json)
end
