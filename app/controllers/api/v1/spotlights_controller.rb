class Api::V1::SpotlightsController < Api::V1::BaseController
  def index
    spotlight = Spotlight.last

    render json: spotlight
  end
end
