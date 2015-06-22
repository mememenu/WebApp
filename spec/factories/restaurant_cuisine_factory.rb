FactoryGirl.define do
  factory :restaurant_cuisine do
    association :cuisine, factory: :cuisine
    association :restaurant, factory: :restaurant
  end
end
