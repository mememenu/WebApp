json.array!(@active_menus) do |menu|
  json.extract! menu, :name, :id
end