class DishSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :avatar, :restaurant_name, :restaurant_avatar,
             :restaurant_zone, :restaurant_city, :restaurant_region, :menu_name,
             :category_name, :monday_hours, :tuesday_hours, :wednesday_hours,
             :thursday_hours, :friday_hours, :saturday_hours, :sunday_hours, :website,
             :photographer_name, :photographer_media_link, :facebook, :twitter, :instagram,
             :cloud_front, :maps_url, :address_1, :state, :zipcode, :lat, :long, :phone, :slug,
             :restaurant_header, :city, :menu_id, :delivery_url, :foursquare_id, :status,
             :restaurant_banner

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

  def monday_hours
    object.restaurant.monday_hours if object.restaurant.monday_hours.present?
  end

  def tuesday_hours
    object.restaurant.tuesday_hours if object.restaurant.tuesday_hours.present?
  end

  def wednesday_hours
    object.restaurant.wednesday_hours if object.restaurant.wednesday_hours.present?
  end

  def thursday_hours
    object.restaurant.thursday_hours if object.restaurant.thursday_hours.present?
  end

  def friday_hours
    object.restaurant.friday_hours if object.restaurant.friday_hours.present?
  end

  def saturday_hours
    object.restaurant.saturday_hours if object.restaurant.saturday_hours.present?
  end

  def sunday_hours
    object.restaurant.sunday_hours if object.restaurant.sunday_hours.present?
  end

  def website
    object.restaurant.website if object.restaurant.website.present?
  end

  def photographer_name
    object.restaurant.photographer_name if object.restaurant.photographer_name.present?
  end

  def photographer_media_link
    object.restaurant.photographer_media_link if object.restaurant.photographer_media_link.present?
  end

  def facebook
    object.restaurant.facebook if object.restaurant.facebook.present?
  end

  def twitter
    object.restaurant.twitter if object.restaurant.twitter.present?
  end

  def instagram
    object.restaurant.instagram if object.restaurant.instagram.present?
  end

  def cloud_front
    object.cloud_front if object.cloud_front.present?
  end

  def maps_url
    object.restaurant.maps_url if object.restaurant.maps_url.present?
  end

  def address_1
    object.restaurant.address_1 if object.restaurant.address_1.present?
  end

  def state
    object.restaurant.state if object.restaurant.state.present?
  end

  def zipcode
    object.restaurant.zipcode if object.restaurant.zipcode.present?
  end

  def lat
    object.restaurant.latitude if object.restaurant.latitude.present?
  end

  def long
    object.restaurant.longitude if object.restaurant.longitude.present?
  end

  def phone
    object.restaurant.phone if object.restaurant.phone.present?
  end

  def slug
    object.restaurant.slug if object.restaurant.slug.present?
  end

  def restaurant_header
    object.restaurant.restaurant_header.avatar.exists? &&
      object.restaurant.restaurant_header.avatar
  end

  def restaurant_banner
    object.restaurant.restaurant_banner.avatar.exists? &&
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
    object.restaurant.delivery_url if object.restaurant.delivery_url.present?
  end

  def foursquare_id
    object.restaurant.foursquare_id if object.restaurant.foursquare_id.present?
  end

  def status
    object.restaurant.status if object.restaurant.status.present?
  end
end
