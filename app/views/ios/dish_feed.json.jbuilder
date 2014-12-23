json.array!(@dishes) do |dish|
  json.extract! dish, :name, :description, :avatar, :restaurant_id
end
json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :name, :avatar
end
