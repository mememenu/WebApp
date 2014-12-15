json.array!(@dishes) do |dish|
  json.extract! dish, :name, :description, :avatar, :restaurant_id
end