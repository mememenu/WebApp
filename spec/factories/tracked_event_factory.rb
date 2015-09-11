FactoryGirl.define do
  factory :tracked_event do
    factory :visit_event do
      kind "Visit"
    end

    factory :resource_detail_view_event do
      kind "ResourceDetailView"

      trait :for_place do
        eventable_id 123456
        eventable_type "Place"
      end
    end

    factory :topic_view_event do
      kind "TopicView"
      title "dummy topic view"
    end
  end
end
