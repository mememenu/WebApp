class List < ActiveRecord::Base
  KIND = ["HomePageList", "UserList", "FeaturedList"]

  has_and_belongs_to_many :places
  has_many :spotlight_items, as: :spotable
  belongs_to :user

  validates :name, presence: true
  validates :kind, inclusion: { in: KIND }, allow_nil: true

  before_create :set_default_name

  scope :user_lists, ->(user_id) { where(user_id: user_id, kind: "UserList") }
  scope :home_page_lists, -> { where(kind: "HomePageList") }
  scope :featured_lists, -> { where(kind: "FeaturedList") }

  def user_list?
    kind == "UserList"
  end

  def home_page_list?
    kind == "HomePageList"
  end

  def featured_list?
    kind == "FeaturedList"
  end

  private

  def set_default_name
    self.name = "My List" if user_list?
  end
end
