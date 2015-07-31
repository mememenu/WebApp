FactoryGirl.define do
  factory :list do
    sequence(:name) { |i| "List #{i}" }
  end
end
