json.array!(@menus) do |menu|
  json.extract! menu, :id, :name, :display_name, :description, :restaurant_id
  json.url menu_url(menu, format: :json)
end
