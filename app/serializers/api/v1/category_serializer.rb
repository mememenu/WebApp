class Api::V1::CategorySerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :dishes, serializer: Api::V1::DishSerializer

  def dishes
    object.dishes.unhidden
  end
end
