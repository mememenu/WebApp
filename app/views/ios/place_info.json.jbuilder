json.array!(@places) do |place|
  json.partial! 'ios/base_place', place: place
end
