FactoryGirl.define do
  factory :ingredient do
    association :dish, factory: :dish
    association :restaurant, factory: :restaurant
    sequence(:name) { |i| "Ingredient #{i}" }
  end
end
