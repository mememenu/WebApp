FactoryGirl.define do
  factory :dish do
    association :restaurant, factory: :restaurant

    after(:build) do |dish|
      dish.menu ||= FactoryGirl.create(:menu, restaurant: dish.restaurant)
    end

    after(:build) do |dish|
      dish.category ||= FactoryGirl.create(:category, restaurant: dish.restaurant,
                                         menu: dish.menu)
    end

    trait :with_avatar do
      avatar { fixture_file_upload(Rails.root + 'spec/fixtures/images/896x1052.jpeg', 'image/jpeg') }
    end
  end
end
