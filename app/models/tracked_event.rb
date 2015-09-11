class TrackedEvent < ActiveRecord::Base
  EVENT_KIND = ['Visit', 'ResourceDetailView', 'TopicView']

  validates :kind, presence: true, inclusion: { in: EVENT_KIND }
  validates :name, presence: true, if: "kind == 'TopicView'"
end
