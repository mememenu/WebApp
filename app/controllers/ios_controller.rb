class IosController < ApplicationController
  before_action :find_menus, only: [:menu_info]

  # GET ios/restaurant_info.json
  def restaurant_info
    @restaurants = Restaurant.where(hide: [nil, false])
  end

  # GET ios/menu_info/1.json
  def menu_info
    @menus = Menu.where(restaurant_id: @restaurant.id)
    @active_menus = @menus.where(hide: [nil, false]).order(priority: :asc)
  end


  private

  def find_menus
    @restaurant = Restaurant.find_by_slug!(params[:id])
  end

end
