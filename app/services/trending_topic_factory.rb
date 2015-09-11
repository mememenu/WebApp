class TrendingTopicFactory
  TRENDING_SET_SIZE = 8
  MAX_REAL_AMOUNT = 5
  TOPIC_CATEGORIES = %w(place_zone place_name tag_name)

  def self.call(target_date = nil)
    TrendingTopicFactory.new(target_date)
  end

  def initialize(target_date = nil)
    @target_date = target_date || Time.current

    @result_topics = []
    fill_with_trending_tracked_events
    fill_with_random_topics

    @result_topics
  end

  private

  def fill_with_trending_tracked_events
    topic_view_events = TrackedEvent.for_the_past_week
                                    .topic_views
                                    .group([:eventable_id, :eventable_type, :title])
                                    .limit(MAX_REAL_AMOUNT)
                                    .order('count_id desc')
                                    .count('id')

    topic_view_events.keys.each do |id, klass, title|
      topic = find_or_create_topic_by(id, klass, title)
      @result_topics << topic if topic
    end
  end

  def fill_with_random_topics
    random_needed = TRENDING_SET_SIZE - @result_topics.count
    random_needed.times do
      target = %w(place_zone place_name tag_name).sample
      append_topic(target)
    end
  end

  def append_topic(target)
    target_klass_name, attr_name = target.split('_')
    klass = target_klass_name.capitalize.constantize
    used_ids = @result_topics.select{ |t| t.topicable_type == klass.name }.
                              map(&:topicable_id)
    used_titles = @result_topics.map(&:title)
    resource = klass.unhidden.
                     where.not(:id => used_ids, :"#{attr_name}" => used_titles).
                     order("RANDOM()").
                     first
    if resource
      topic = find_or_create_topic_by(resource.id, klass.name, resource.send(:"#{attr_name}"))
      @result_topics << topic if topic
    end
  end

  def find_or_create_topic_by(id, klass, title)
    resource = klass.constantize.unhidden.find_by_id(id)

    if resource
      topic = Topic.find_or_initialize_by(title: title, topicable: resource)
      topic.target_date = @target_date
      topic.save

      topic
    end
  end
end
