FactoryGirl.define do
  factory :topic do
    target_date Time.current

    factory :tag_name_topic do
      after(:build) do |tnt|
        tnt.topicable ||= FactoryGirl.create(:tag)
        tnt.title = tnt.topicable.name
      end
    end

    factory :place_name_topic do
      after(:build) do |tnt|
        tnt.topicable ||= FactoryGirl.create(:place)
        tnt.title = tnt.topicable.name
      end
    end

    factory :place_zone_topic do
      after(:build) do |tnt|
        tnt.topicable ||= FactoryGirl.create(:place)
        tnt.title = tnt.topicable.zone
      end
    end
  end
end
