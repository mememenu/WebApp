class Api::V1::PlacesController < Api::V1::BaseController
  def nearby
    head :bad_request and return unless location && distance
    near_places = Place.near(location, distance)

    render json: near_places, each_serializer: NearbySerializer, sent_location: location
  end

  private

  def location
    return @location unless @location.nil?

    if params[:location] && params[:location].is_a?(Array) && params[:location].length == 2
      @location = params[:location].each do |l|
        return false if l.blank?
        l.to_f
      end
    end
  end

  def distance
    return @distance unless @distance.nil?
    return false unless params[:distance]

    @distance = params[:distance].to_i
  end
end
