class Api::V1::MenuSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :categories, serializer: CategorySerializer
end
