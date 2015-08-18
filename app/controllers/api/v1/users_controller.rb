class Api::V1::UsersController < Api::V1::BaseController
  def list
    render json: current_user.list
  end
end
