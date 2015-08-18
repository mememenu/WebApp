class Api::V1::ListsController < Api::V1::BaseController
  def index
    kind = params[:kind] || "GenericList"
    limit = params[:limit] || 100
    lists = List.where(kind: kind).limit(limit)

    render json: lists
  end
end
