json.array!(@active_categories) do |category|
  json.extract! category, :name, :menu_id
end