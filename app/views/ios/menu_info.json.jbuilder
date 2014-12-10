json.array!(@active_menus) do |menu|
  json.extract! menu, :name
  json.url menu_url(menu, format: :json)
end