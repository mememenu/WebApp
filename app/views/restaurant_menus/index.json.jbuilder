json.array!(@restaurant_menus) do |restaurant_menu|
  json.extract! restaurant_menu, :id, :restaurant_id, :menu_id
  json.url restaurant_menu_url(restaurant_menu, format: :json)
end
