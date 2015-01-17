class DishSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :avatar, :restaurant_name, :restaurant_avatar, :restaurant_zone, :menu_name, :category_name, :monday_hours, :tuesday_hours, :wednesday_hours, :thursday_hours, :friday_hours, :saturday_hours, :sunday_hours

  def restaurant_name
    object.restaurant.name
  end

  def restaurant_avatar
    object.restaurant.avatar
  end

  def restaurant_zone
    object.restaurant.zone
  end

  def menu_name
    object.menu.name
  end

  def category_name
    object.category.name
  end

  def monday_hours
    object.restaurant.monday_hours
  end
  
  def tuesday_hours
    object.restaurant.tuesday_hours
  end

  def wednesday_hours
    object.restaurant.wednesday_hours
  end

  def thursday_hours
    object.restaurant.thursday_hours
  end

  def friday_hours
    object.restaurant.friday_hours
  end

  def saturday_hours
    object.restaurant.saturday_hours
  end

  def sunday_hours
    object.restaurant.sunday_hours
  end


end
