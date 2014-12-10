json.array!(@active_categories) do |category|
  json.extract! category, :id, :name, :menu_id
end