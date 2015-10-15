class HomePage < ActiveRecord::Base
  has_one :spotlight
  has_one :featured_list, -> { where(kind: "FeaturedList") }, class_name: 'List'
  has_many :contributor_lists, -> { where(kind: "ContributorList") }, class_name: 'List'
  has_many :generic_lists, -> { where(kind: "GenericList") }, class_name: 'List'

  validates :spotlight, presence: true
  validates :featured_list, presence: true
  validates :contributor_lists, presence: true
  validates :generic_lists, presence: true

  def available_generic_lists
    List.unhidden.generic_lists.where.not(id: generic_lists.pluck(:id))
  end

  def available_contributor_lists
    List.unhidden.contributor_lists.where.not(id: contributor_lists.pluck(:id))
  end
end
