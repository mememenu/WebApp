FactoryGirl.define do
  factory :event do
    sequence(:name) { |i| "Event #{i}" }
    starts_at DateTime.current
    ends_at DateTime.current + 1.day

    after(:build) do |event|
      event.place ||= FactoryGirl.create(:place)
    end
  end
end
