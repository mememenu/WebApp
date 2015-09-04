class Event < ActiveRecord::Base
  has_many :spotlight_items, as: :spotable
  belongs_to :place

  validates :name, presence: true, uniqueness: { scope: :place }
  validates :place, presence: true
  validates :reservations, inclusion: { in: [true, false] }
  validates :starts_at, presence: true
  validates :ends_at, presence: true
end
