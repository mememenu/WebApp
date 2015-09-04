class Api::V1::DishSerializer < ActiveModel::Serializer
  attributes :id, :name, :description

  has_one :default_image, serializer: Api::V1::ImageSerializer
end
