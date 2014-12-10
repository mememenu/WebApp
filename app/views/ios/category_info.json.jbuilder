json.array!(@active_categories) do |category|
  json.extract! category, :name
end