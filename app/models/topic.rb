class Topic < ActiveRecord::Base
  belongs_to :topicable, polymorphic: true

  validates_presence_of :title, :target_date

  scope :for_date, -> (date) { where(target_date: date.beginning_of_day..date.end_of_day) }
end
