class MenuSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :categories, serializer: CategorySerializer

  def categories
    object.categories.unhidden.order(priority: :asc)
  end
end
