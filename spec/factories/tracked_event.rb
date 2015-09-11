FactoryGirl.define do
  factory :tracked_event do
    factory :visit_event do
      kind "Visit"
    end

    factory :resource_detail_view_event do
      kind "ResourceDetailView"
    end

    factory :topic_view_event do
      kind "TopicView"
    end
  end
end
