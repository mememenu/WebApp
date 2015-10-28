class Api::V1::BaseController < ActionController::Base
  doorkeeper_for :all

  respond_to :json

  def current_user
    super || User.find_by_id(doorkeeper_token.resource_owner_id)
  end
end
