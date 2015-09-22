class PlaceSerializer < ActiveModel::Serializer
  attributes :id, :type, :name, :logo, :zone
  has_one :banner

  def type
    object.class.name
  end

  def logo
    object.avatar.url
  end
end
