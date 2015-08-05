class Api::V1::ListsController < Api::V1::BaseController
  def index
    lists = List.all

    render json: lists
  end
end
