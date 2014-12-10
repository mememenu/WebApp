json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :name
end