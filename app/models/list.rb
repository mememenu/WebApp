class List < ActiveRecord::Base
  has_and_belongs_to_many :places
  has_many :spotlight_items, as: :spotable
  belongs_to :user

  validates :name, presence: true

  before_create :set_default_name

  private

  def set_default_name
    self.name = "My List" if user
  end
end
