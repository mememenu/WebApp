class Api::V1::SpotlightItemSerializer < ActiveModel::Serializer
  attributes :id, :image_url, :position
  has_one :spotable

  def image_url
    object.avatar.url
  end
end
