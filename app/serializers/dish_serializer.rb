class DishSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :avatar, :restaurant_name, :restaurant_avatar, :restaurant_zone, :menu_name, :category_name

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
  
end
