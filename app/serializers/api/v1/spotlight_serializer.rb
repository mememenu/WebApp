class Api::V1::SpotlightSerializer < ActiveModel::Serializer
  attributes :id

  has_many :spotlight_items

  def spotlight_items
    object.spotlight_items.order(position: :asc)
  end
end
