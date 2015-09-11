class TrackedEvent < ActiveRecord::Base
  EVENT_KIND = ['Visit', 'ResourceDetailView', 'TopicView']

  validates :kind, presence: true, inclusion: { in: EVENT_KIND }
  validates :title, presence: true, if: "kind == 'TopicView'"

  scope :for_the_past_week, -> { where("created_at > ?", 1.week.ago) }
  scope :topic_views, -> { where(kind: "TopicView") }
end
