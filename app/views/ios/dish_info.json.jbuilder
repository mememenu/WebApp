json.array!(@active_dishes) do |dish|
  json.extract! dish, :name, :category_id, :menu_id, :description, :avatar, :cloud_front
end
