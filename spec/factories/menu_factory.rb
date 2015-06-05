FactoryGirl.define do
  factory :menu do
    name "Test Menu"
    sequence(:priority) { |i| i }
    association :restaurant, factory: :restaurant
  end
end
