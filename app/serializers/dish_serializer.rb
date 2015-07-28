class DishSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :avatar, :restaurant_name, :restaurant_avatar,
             :restaurant_zone, :restaurant_city, :restaurant_region, :menu_name,
             :category_name, :website, :photographer_name, :photographer_media_link,
             :facebook, :twitter, :instagram, :cloud_front, :maps_url, :address_1,
             :state, :zipcode, :lat, :long, :phone, :slug, :restaurant_header, :city,
             :menu_id, :delivery_url, :foursquare_id, :status, :restaurant_banner

  def avatar
    object.default_image.try(:avatar)
  end

  def restaurant_name
    object.place.name
  end

  def restaurant_avatar
    object.place.avatar
  end

  def restaurant_zone
    object.place.zone
  end

  def restaurant_city
    object.place.city
  end

  def restaurant_region
    object.place.region
  end

  def menu_name
    object.menu.name
  end

  def category_name
    object.category.name
  end

  def website
    object.place.website
  end

  def photographer_name
    object.place.photographer_name
  end

  def photographer_media_link
    object.place.photographer_media_link
  end

  def facebook
    object.place.facebook
  end

  def twitter
    object.place.twitter
  end

  def instagram
    object.place.instagram
  end

  def cloud_front
    object.default_image.try(:cloudfront_url)
  end

  def maps_url
    object.place.maps_url
  end

  def address_1
    object.place.address_1
  end

  def state
    object.place.state
  end

  def zipcode
    object.place.zipcode
  end

  def lat
    object.place.latitude
  end

  def long
    object.place.longitude
  end

  def phone
    object.place.phone
  end

  def slug
    object.place.slug
  end

  def restaurant_header
    object.place.header.present? &&
      object.place.header.avatar.present? &&
      object.place.header.avatar
  end

  def restaurant_banner
    object.place.banner.present? &&
      object.place.banner.avatar.present? &&
      object.place.banner.avatar
  end

  def city
    object.place.city
  end

  def lat
    object.place.latitude
  end

  def long
    object.place.longitude
  end

  def menu_id
    object.menu.priority
  end

  def delivery_url
    object.place.delivery_url
  end

  def foursquare_id
    object.place.foursquare_id
  end

  def status
    object.place.status
  end
end
