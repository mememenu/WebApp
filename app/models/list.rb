class List < ActiveRecord::Base
  KIND = ["GenericList", "UserList", "FeaturedList", "ContributorList"]

  has_and_belongs_to_many :places
  has_many :spotlight_items, as: :spotable
  belongs_to :user
  belongs_to :home_page

  validates :name, presence: true
  validates :kind, inclusion: { in: KIND }, allow_nil: true

  before_create :set_default_name

  scope :user_lists, ->(user_id) { where(user_id: user_id, kind: "UserList") }
  scope :generic_lists, -> { where(kind: "GenericList") }
  scope :featured_lists, -> { where(kind: "FeaturedList") }

  def user_list?
    kind == "UserList"
  end

  def generic_list?
    kind == "GenericList"
  end

  def featured_list?
    kind == "FeaturedList"
  end

  private

  def set_default_name
    self.name = "My List" if user_list?
  end
end
