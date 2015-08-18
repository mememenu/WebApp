class Api::V1::ListSerializer < ActiveModel::Serializer
  attributes :id, :type, :name

  has_many :places

  def type
    object.class.name
  end
end
