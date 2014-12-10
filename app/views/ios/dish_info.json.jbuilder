json.array!(@active_dishes) do |dish|
  json.extract! dish, :name, :description, :avatar
end