include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :spotlight_item do
    sequence(:position) { |i| i }

    trait :with_image do
      avatar { fixture_file_upload(Rails.root + 'spec/fixtures/images/896x1052.jpeg', 'image/jpeg') }
    end

    factory :list_item do
      association :spotable, factory: :featured_list
    end

    factory :place_item do
      association :spotable, factory: :place
    end

    factory :event_item do
      association :spotable, factory: :event
    end
  end
end
