class IosController < ApplicationController
  before_action :find_restaurant, only: [:menu_info, :category_info, :dish_info, :category_info_by_menu]

  # GET ios/restaurant_info.json
  def restaurant_info
    @restaurants = Restaurant.where(hide: [nil, false])
  end

  # GET ios/menu_info/1.json
  def menu_info
    @menus = Menu.where(restaurant_id: @restaurant.id)
    @active_menus = @menus.where(hide: [nil, false]).order(priority: :asc)
    @categories = Category.where(restaurant_id: @restaurant.id)
    @active_categories = @categories.where(hide: [nil, false]).order(priority: :asc)
    @dishes = Dish.where(restaurant_id: @restaurant.id)
    @active_dishes = @dishes.where(hide: [nil, false]).order(:menu_id, :category_id, :name)
  end

  # GET ios/category_info/1.json
  def category_info
    @categories = Category.where(restaurant_id: @restaurant.id)
    @active_categories = @categories.where(hide: [nil, false]).order(priority: :asc)
  end

  def dish_info
    @dishes = Dish.where(restaurant_id: @restaurant.id)
    @active_dishes = @dishes.where(hide: [nil, false]).order(:menu_id, :category_id, :name)
  end

  def dish_feed
    @dishes = Dish.where(hide: [nil, false]).order(updated_at: :desc).limit(40)
  end

  def paginated_dish_feed
    @dishes = Dish.where(hide: [nil, false]).order(updated_at: :desc)
    paginate json: @dishes
  end

  def category_info_by_menu
    @menus = Menu.where(restaurant_id: @restaurant.id)
    @active_menus = @menus.where(hide: [nil, false]).order(priority: :asc)

    @categories = Category.where(restaurant_id: @restaurant.id)
    @active_categories = @categories.where(hide: [nil, false]).order(priority: :asc)
  end


  private

  def find_restaurant
    @restaurant = Restaurant.find_by_slug!(params[:id])
  end

  # def find_menu
  #   @menu = Menu.find(params[:id])

end
