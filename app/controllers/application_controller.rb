class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def validate_place_owner_or_admin
    if !current_user.admin? && !(@place && current_user.owns_place?(@place))
      redirect_to root_path
    end
  end

  def validate_admin
    redirect_to root_path unless current_user.admin?
  end

  protected

  def configure_permitted_parameters
    [:sign_up, :account_update].each do |action|
      devise_parameter_sanitizer.for(action).push(:admin, :place, :place_id)
    end
  end

end
