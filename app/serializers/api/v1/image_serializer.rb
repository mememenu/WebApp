class Api::V1::ImageSerializer < ActiveModel::Serializer
  attributes :id, :image_url, :cloudfront_url

  def image_url
    object.avatar.url
  end
end
