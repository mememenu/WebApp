require 'rails_helper'

describe TrendingTopicFactory, type: :service do
  include ActiveSupport::Testing::TimeHelpers
  before do
    @places = FactoryGirl.create_list(:place, 5)
    @tags = FactoryGirl.create_list(:tag, 5)

    travel_to 2.weeks.ago do
      @places.each_with_index do |place, index|
        FactoryGirl.create_list(:topic_view_event, index, title: place.name,
                                eventable_id: place.id, eventable_type: place.class.name)
      end
    end
  end

  context "with tracked events in the past weeks" do
    before do
      travel_to 3.days.ago do
        @places.each_with_index do |place, index|
          FactoryGirl.create_list(:topic_view_event, (index * 2) + 1, title: place.name,
                                  eventable_id: place.id, eventable_type: place.class.name)
        end
        @tags.each_with_index do |tag, index|
          FactoryGirl.create_list(:topic_view_event, index * 2, title: tag.name,
                                  eventable_id: tag.id, eventable_type: tag.class.name)
        end
      end
    end

    it "generates 8 topics for the specified date" do
      TrendingTopicFactory.call(Date.yesterday)
      topics = Topic.for_date(Date.yesterday)

      expect(topics.count).to eq(8)
    end

    it "generates a maximum of 3 different random topics each day" do
      TrendingTopicFactory.call(Date.yesterday)
      yesterday_topics = Topic.for_date(Date.yesterday).map(&:title)

      TrendingTopicFactory.call(Date.current)
      today_topics = Topic.for_date(Date.current).map(&:title)

      diff = yesterday_topics - today_topics

      expect(diff.count).to be <= 3
    end

    it "includes the most 5 visited topics in the last week" do
      trending_titles = @places.last(3).map(&:name) + @tags.last(2).map(&:name)
      TrendingTopicFactory.call(Date.current)
      today_topics = Topic.for_date(Date.current).map(&:title)

      expect(today_topics).to include(*trending_titles)
    end
  end
end
