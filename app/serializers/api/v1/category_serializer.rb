class Api::V1::CategorySerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :dishes, serializer: DishSerializer
end
