class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def validate_restaurant_owner_or_admin

    unless current_user.admin
      if @restaurant
        if current_user.restaurant_id == @restaurant.id
        else
          redirect_to root_path
        end
      elsif @menu
        if current_user.restaurant_id == @menu.restaurant.id
        else
          redirect_to root_path
        end
      elsif @category
        if current_user.restaurant_id == @category.menu.restaurant.id
        else
          redirect_to root_path
        end
      elsif @dish
        if current_user.restaurant_id == @dish.category.menu.restaurant.id
        else
          redirect_to root_path
        end
      elsif @image
        if current_user.restaurant_id == @image.dish.category.menu.restaurant.id
        else
          redirect_to root_path
        end
      else
        redirect_to root_path
      end
    end

  end

  def validate_admin
    if current_user.admin
    else
      redirect_to root_path
    end
  end

  protected

  def configure_permitted_parameters
    [:sign_up, :account_update].each do |action|
      devise_parameter_sanitizer.for(action).push(:admin, :restaurant, :restaurant_id)
    end
  end

end
