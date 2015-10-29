class Api::V1::UsersController < Api::V1::BaseController
  def list
    render json: current_user.default_list, serializer: Api::V1::ListSerializer
  end

  def lists
    render json: current_user.other_lists,
      each_serializer: Api::V1::ListSerializer,
      root: false
  end
end
