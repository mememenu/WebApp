FactoryGirl.define do
  factory :restaurant do
    sequence(:name) { |i| "Restaurant #{i}" }
    address_1 "123 Test St."
    city "Miami"
    state "FL"
    zipcode "12345"
    phone "0123456789"
    zone "Miami Beach"
    foursquare_id "123456"
  end
end
