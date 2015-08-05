class Api::V1::HomePagesController < Api::V1::BaseController
  def index
    home_page = HomePage.last

    render json: home_page
  end
end
