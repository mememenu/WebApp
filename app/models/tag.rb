class Tag < ActiveRecord::Base
  has_and_belongs_to_many :places
  has_many :topics, as: :topicable

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  scope :unhidden, -> { where(hide: [nil, false]) }
end
