json.array!(@active_dishes) do |dish|
  json.extract! dish, :name, :category_id, :description, :avatar
end