FactoryGirl.define do
  factory :image do
    association :dish, factory: :dish

    trait :with_avatar do
      avatar { fixture_file_upload(Rails.root + 'spec/fixtures/images/896x1052.jpeg', 'image/jpeg') }
    end
  end
end
