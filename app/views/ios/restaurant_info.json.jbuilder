json.array!(@restaurants) do |restaurant|
  json.partial! 'ios/base_restaurant', restaurant: restaurant
end
