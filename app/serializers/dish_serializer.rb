class DishSerializer < ActiveModel::Serializer
  
  attributes :id, :name, :description, :avatar, :restaurant_name, :restaurant_avatar, :restaurant_zone, :restaurant_city, :restaurant_region, :menu_name, :category_name, :monday_hours, :tuesday_hours, :wednesday_hours, :thursday_hours, :friday_hours, :saturday_hours, :sunday_hours, :website, :photographer_name, :photographer_media_link, :facebook, :twitter, :instagram, :cloud_front, :maps_url, :address_1, :state, :zipcode, :phone, :slug, :restaurant_header, :city, :menu_id, :delivery_url, :foursquare_id, :status, :restaurant_banner

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
    object.restaurant.monday_hours unless object.restaurant.monday_hours.class == nil
  end
  
  def tuesday_hours
    object.restaurant.tuesday_hours unless object.restaurant.tuesday_hours.class == nil
  end

  def wednesday_hours
    object.restaurant.wednesday_hours unless object.restaurant.wednesday_hours.class == nil
  end

  def thursday_hours
    object.restaurant.thursday_hours unless object.restaurant.thursday_hours.class == nil
  end

  def friday_hours
    object.restaurant.friday_hours unless object.restaurant.friday_hours.class == nil
  end

  def saturday_hours
    object.restaurant.saturday_hours unless object.restaurant.saturday_hours.class == nil
  end

  def sunday_hours
    object.restaurant.sunday_hours unless object.restaurant.sunday_hours.class == nil
  end

  def website
    object.restaurant.website unless object.restaurant.website.class == nil
  end

  def photographer_name
    object.restaurant.photographer_name unless object.restaurant.photographer_name.class == nil
  end

  def photographer_media_link
    object.restaurant.photographer_media_link unless object.restaurant.photographer_media_link.class == nil
  end

  def facebook
    object.restaurant.facebook unless object.restaurant.facebook.class == nil
  end

  def twitter
    object.restaurant.twitter unless object.restaurant.twitter.class == nil
  end
  
  def instagram
    object.restaurant.instagram unless object.restaurant.instagram.class == nil
  end

  def cloud_front
    object.cloud_front unless object.cloud_front.class == nil 
  end

  def maps_url
    object.restaurant.maps_url unless object.restaurant.maps_url.class == nil 
  end

  def address_1
    object.restaurant.address_1 unless object.restaurant.address_1.class == nil
  end

  def state
    object.restaurant.state unless object.restaurant.state.class == nil
  end

  def zipcode
    object.restaurant.zipcode unless object.restaurant.zipcode.class == nil
  end

  def phone
    object.restaurant.phone unless object.restaurant.phone.class == nil
  end

  def slug
    object.restaurant.slug unless object.restaurant.slug.class == nil
  end 

  def restaurant_header
    object.restaurant.restaurant_header.avatar unless  object.restaurant.restaurant_header.avatar.class == nil
  end

  def restaurant_banner
    object.restaurant.restaurant_banner.avatar unless  object.restaurant.restaurant_banner.class == nil
  end
  
  def city
    object.restaurant.city
  end

  def menu_id
    object.menu.priority
  end

  def delivery_url
    object.restaurant.delivery_url unless  object.restaurant.delivery_url.class == nil
  end

  def foursquare_id
    object.restaurant.foursquare_id unless  object.restaurant.foursquare_id.class == nil
  end

  def status
    object.restaurant.status unless  object.restaurant.status.class == nil
  end

end
