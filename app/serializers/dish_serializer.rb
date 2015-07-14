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
    object.restaurant.name
  end

  def restaurant_avatar
    object.restaurant.avatar
  end

  def restaurant_zone
    object.restaurant.zone
  end

  def restaurant_city
    object.restaurant.city
  end

  def restaurant_region
    object.restaurant.region
  end

  def menu_name
    object.menu.name
  end

  def category_name
    object.category.name
  end

  def website
    object.restaurant.website
  end

  def photographer_name
    object.restaurant.photographer_name
  end

  def photographer_media_link
    object.restaurant.photographer_media_link
  end

  def facebook
    object.restaurant.facebook
  end

  def twitter
    object.restaurant.twitter
  end

  def instagram
    object.restaurant.instagram
  end

  def cloud_front
    object.default_image.try(:cloudfront_url)
  end

  def maps_url
    object.restaurant.maps_url
  end

  def address_1
    object.restaurant.address_1
  end

  def state
    object.restaurant.state
  end

  def zipcode
    object.restaurant.zipcode
  end

  def lat
    object.restaurant.latitude
  end

  def long
    object.restaurant.longitude
  end

  def phone
    object.restaurant.phone
  end

  def slug
    object.restaurant.slug
  end

  def restaurant_header
    object.restaurant.restaurant_header.present? &&
      object.restaurant.restaurant_header.avatar.present? &&
      object.restaurant.restaurant_header.avatar
  end

  def restaurant_banner
    object.restaurant.restaurant_banner.present? &&
      object.restaurant.restaurant_banner.avatar.present? &&
      object.restaurant.restaurant_banner.avatar
  end

  def city
    object.restaurant.city
  end

  def lat
    object.restaurant.latitude
  end

  def long
    object.restaurant.longitude
  end

  def menu_id
    object.menu.priority
  end

  def delivery_url
    object.restaurant.delivery_url
  end

  def foursquare_id
    object.restaurant.foursquare_id
  end

  def status
    object.restaurant.status
  end
end
