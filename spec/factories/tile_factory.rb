FactoryGirl.define do
  factory :tile do
    association :place, factory: :place

    trait :with_avatar do
      avatar { fixture_file_upload(Rails.root + 'spec/fixtures/images/896x1052.jpeg', 'image/jpeg') }
    end
  end
end
