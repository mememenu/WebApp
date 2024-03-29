class Api::V1::PlacesController < Api::V1::BaseController
  before_filter :set_place, only: [:add_to_list]
  def nearby
    head :bad_request and return unless location && distance
    near_places = Place.unhidden.near(location, distance)

    render json: near_places, each_serializer: Api::V1::Place::NearbySerializer,
                              sent_location: location
  end

  def show
    place = ::Place.unhidden.find(params[:id])

    render json: place, serializer: Api::V1::Place::ShowSerializer, root: false
  end

  def search
    if params[:query].present?
      querable_fields = ["tags.name", "places.name", "places.zone"]
      fields_to_search = querable_fields.map do |field_name|
        "lower(#{field_name}) like :query"
      end.join(" OR ")

      places = Place.unhidden.joins(
        "LEFT OUTER JOIN places_tags ON places_tags.place_id = places.id\
         LEFT OUTER JOIN tags ON tags.id = places_tags.tag_id").
        where(fields_to_search, query: "%#{params[:query]}%".downcase)

      render json: places, each_serializer: Api::V1::Place::SearchSerializer
    else
      head :bad_request
    end
  end

  def index
    result = Place.unhidden.limit(100)
    result = result.where(zone: params[:zone]) if params[:zone].present?

    if params[:tag].present?
      result = result.joins(:tags).where(tags: { name: params[:tag] })
    end

    render json: result
  end

  def add_to_list
    if params[:list_id]
      list = List.user_lists(current_user.id).find_by_id(params[:list_id])
    end

    list ||= current_user.default_list

    unless list.places.exists?(@place.id)
      list.places << @place
    end

    head :ok
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

  def set_place
    if params[:id]
      @place = Place.find_by_id(params[:id])
    end

    render nothing: true, status: :not_found unless @place
  end
end
