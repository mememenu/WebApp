FactoryGirl.define do
  factory :tracked_event do
    factory :visit_event do
      kind "Visit"
    end

    factory :resource_detail_view_event do
      kind "ResourceDetailView"

      trait :for_place do
        eventable_id FactoryGirl.create(:place).id
        eventable_type "Place"
      end
    end

    factory :topic_view_event do
      kind "TopicView"
    end
  end
end
