json.array!(@categories) do |category|
  json.extract! category, :id, :name, :display_name
  json.url category_url(category, format: :json)
end
