class Api::V1::TopicSerializer < ActiveModel::Serializer
  attributes :id, :title, :topicable_id, :topicable_type
end
