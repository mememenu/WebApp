json.array!(@dish_ingredients) do |dish_ingredient|
  json.extract! dish_ingredient, :id, :dish_id, :ingredient_id
  json.url dish_ingredient_url(dish_ingredient, format: :json)
end
