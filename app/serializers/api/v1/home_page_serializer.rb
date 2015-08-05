class Api::V1::HomePageSerializer < ActiveModel::Serializer
  attributes :id
  has_one :spotlight
  has_one :featured_list
  has_many :contributor_lists
  has_many :generic_lists
end
