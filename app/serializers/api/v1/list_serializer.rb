class Api::V1::ListSerializer < ActiveModel::Serializer
  attributes :id, :type, :name, :cloudfront_url

  has_many :places

  def type
    object.class.name
  end
end
