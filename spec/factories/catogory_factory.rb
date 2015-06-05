FactoryGirl.define do
  factory :category do
    name "Test category"
    sequence(:priority) { |i| i }
    association :restaurant, factory: :restaurant

    after(:build) do |dish|
      dish.menu = FactoryGirl.create(:menu, restaurant: dish.restaurant)
    end
  end
end
