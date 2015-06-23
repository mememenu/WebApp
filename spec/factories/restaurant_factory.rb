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

    factory :restaurant_with_menus_and_categories do
      after(:create) do |restaurant, _|
        create(:menu, restaurant: restaurant, name: 'Test Menu 1')
        create(:menu, restaurant: restaurant, name: 'Test Menu 2')
        create(:category, restaurant: restaurant, name: 'Test Category 1')
        create(:category, restaurant: restaurant, name: 'Test Category 2')
      end
    end
  end
end
