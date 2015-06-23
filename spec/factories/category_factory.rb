FactoryGirl.define do
  factory :category do
    name "Test category"
    sequence(:priority) { |i| i }
    association :restaurant, factory: :restaurant

    after(:build) do |category|
      category.menu = FactoryGirl.create(:menu, restaurant: category.restaurant)
    end

    factory :category_with_dishes do
      after(:create) do |category, _|
        create(:dish, :with_avatar, category: category)
      end
    end
  end
end