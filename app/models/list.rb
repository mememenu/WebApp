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
  scope :contributor_lists, -> { where(kind: "ContributorList") }
  scope :contributor_lists_from_user, ->(contributor_id) { where(user_id: contributor_id, kind: "ContributorList") }
  scope :generic_lists, -> { where(kind: "GenericList") }
  scope :featured_lists, -> { where(kind: "FeaturedList") }
  scope :unhidden, -> { where(hide: [nil, false]) }

  image_attachment styles: { large: "750x400>", medium: "375x200>" }
  validates :avatar, attachment_presence: true

  def user_list?
    kind == "UserList"
  end

  def generic_list?
    kind == "GenericList"
  end

  def featured_list?
    kind == "FeaturedList"
  end

  def class_name
    "List"
  end

  private

  def set_default_name
    self.name = "My List" if user_list?
  end
end
