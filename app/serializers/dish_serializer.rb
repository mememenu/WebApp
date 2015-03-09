class DishSerializer < ActiveModel::Serializer
  
  attributes :id, :name, :description, :avatar, :restaurant_name, :restaurant_avatar, :restaurant_zone, :restaurant_city, :restaurant_region, :menu_name, :category_name, :monday_hours, :tuesday_hours, :wednesday_hours, :thursday_hours, :friday_hours, :saturday_hours, :sunday_hours, :website, :photographer_name, :photographer_media_link, :facebook, :twitter, :instagram, :cloud_front

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
  
end
