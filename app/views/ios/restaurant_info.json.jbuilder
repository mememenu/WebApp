json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :name, :avatar, :address_1, :address_2, :city, :state, :zipcode, :phone, :zone
end