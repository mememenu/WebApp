class TrackedEvent < ActiveRecord::Base
  EVENT_KIND = ['Visit', 'ResourceDetailView', 'TopicView']

  validates :kind, presence: true, inclusion: { in: EVENT_KIND }
end
