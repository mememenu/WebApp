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

    trait :with_avatar do
      avatar { fixture_file_upload(Rails.root + 'spec/fixtures/images/896x1052.jpeg', 'image/jpeg') }
    end
  end
end
