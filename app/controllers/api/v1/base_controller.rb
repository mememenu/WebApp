class Api::V1::BaseController < ActionController::Base
  doorkeeper_for :all

  respond_to :json
end
