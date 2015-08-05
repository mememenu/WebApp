class Api::V1::PlaceSerializer < ActiveModel::Serializer
  attributes :id, :type, :name, :logo

  def type
    object.class.name
  end

  def logo
    object.avatar.url
  end

  def tile
    object.tile.avatar.url if object.tile
  end
end