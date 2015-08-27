FactoryGirl.define do
  factory :place do
    sequence(:name) { |i| "Place #{i}" }
    address_1 "123 Test St."
    address_2 "Suite 2"
    city "Miami"
    state "FL"
    zipcode "12345"
    phone "0123456789"
    zone "Miami Beach"
    price 2
    foursquare_id "123456"
    google_id "123456"

    trait :with_avatar do
      avatar { fixture_file_upload(Rails.root + 'spec/fixtures/images/896x1052.jpeg', 'image/jpeg') }
    end

    trait :with_banner do
      after(:build) do |place|
        place.banner = FactoryGirl.create(:banner, :with_avatar, place: place)
      end
    end

    trait :with_header do
      after(:build) do |place|
        place.header = FactoryGirl.create(:header, :with_avatar, place: place)
      end
    end

    factory :place_with_menus_and_categories do
      after(:create) do |place, _|
        menu_1 = create(:menu, place: place, name: 'Test Menu 1')
        menu_2 = create(:menu, place: place, name: 'Test Menu 2')
        FactoryGirl.create(:category_with_dishes, place: place,
                           name: 'Test Category 1', menu: menu_1)
        FactoryGirl.create_list(:category_with_dishes, 2, place: place,
                                name: 'Test Category 2', menu: menu_2)
      end
    end
  end
end
