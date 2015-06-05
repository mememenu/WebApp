FactoryGirl.define do
  factory :image do
    association :dish, factory: :dish

    trait :with_avatar do
      avatar File.read(Rails.root + 'spec/fixtures/image.png')
    end
  end
end
