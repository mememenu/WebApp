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

    trait :with_default_image do
      association :default_image, factory: [:default_image, :with_avatar]
    end

    trait :with_additional_images do
      after(:create) do |dish|
        FactoryGirl.create_list(:image, 2, :with_avatar, dish: dish)
      end
    end
  end
end
