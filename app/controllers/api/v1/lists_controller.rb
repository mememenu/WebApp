class Api::V1::ListsController < Api::V1::BaseController
  def featured
    featured = List.featured_lists.last

    render json: featured
  end

  def index
    lists = List.home_page_lists

    render json: lists
  end
end
