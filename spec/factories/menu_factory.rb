FactoryGirl.define do
  factory :menu do
    name "Test Menu"
    sequence(:priority) { |i| i }
    association :place, factory: :place
  end
end
