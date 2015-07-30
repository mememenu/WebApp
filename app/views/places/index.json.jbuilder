json.array!(@places) do |place|
  json.extract! place, :id, :name, :address_1, :address_2, :city, :state, :zipcode, :description, :phone, :dollars, :reservations
  json.url place_url(place, format: :json)
end
