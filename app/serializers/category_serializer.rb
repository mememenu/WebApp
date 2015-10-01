class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :dishes, serializer: NewDishSerializer

  def dishes
    object.dishes.unhidden
  end
end
