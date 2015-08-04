class Api::V1::EventSerializer < ActiveModel::Serializer
  attributes :id, :type, :name

  def type
    object.class.name
  end
end
