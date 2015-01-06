json.array!(@active_menus) do |menu|
  json.name menu.name 
  json.categories menu.categories.each do |category| 
    json.(category, :name)
  end
end