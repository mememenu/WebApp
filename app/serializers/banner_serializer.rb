class BannerSerializer < ActiveModel::Serializer
  attributes :id, :image_url, :cloudfront_url

  def image_url
    object.avatar.url
  end
end
