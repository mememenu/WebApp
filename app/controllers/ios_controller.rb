class IosController < ApplicationController
  before_action :find_place, only: [:menu_info, :category_info, :dish_info, :category_info_by_menu]

  # GET ios/place_info.json
  def place_info
    @places = Place.where(hide: [nil, false])
  end

  def miami_places_list
    @places = Place.where(hide: [nil, false], region: "MIA").order(clean_name: :asc)
  end

  def nearby
    head :bad_request and return unless location && distance
    near_places = Place.unhidden.near(location, distance)

    render json: near_places, each_serializer: Place::NearbySerializer,
                              sent_location: location,
                              root: "places"
  end

  # GET ios/menu_info/1.json
  def menu_info
    @menus = Menu.where(place_id: @place.id)
    @active_menus = @menus.where(hide: [nil, false]).order(priority: :asc)
    @categories = Category.where(place_id: @place.id)
    @active_categories = @categories.where(hide: [nil, false]).order(priority: :asc)
    @dishes = Dish.where(place_id: @place.id)
    @active_dishes = @dishes.where(hide: [nil, false]).order(:menu_id, :category_id, :name)
  end

  # GET ios/category_info/1.json
  def category_info
    @categories = Category.where(place_id: @place.id)
    @active_categories = @categories.where(hide: [nil, false]).order(priority: :asc)
  end

  def dish_info
    @dishes = Dish.where(place_id: @place.id)
    @active_dishes = @dishes.where(hide: [nil, false]).order(:menu_id, :category_id, :name)
  end

  def dish_feed
    @dishes = Dish.where(hide: [nil, false]).order(updated_at: :desc).limit(40)
  end

  def paginated_dish_feed
    @dishes = Dish.where(hide: [nil, false]).order(updated_at: :desc)
    paginate json: @dishes, per_page: 10
  end

  def default_serializer_options
    {root: false}
  end

  def category_info_by_menu
    @menus = Menu.where(place_id: @place.id)
    @active_menus = @menus.where(hide: [nil, false]).order(priority: :asc)

    @categories = Category.where(place_id: @place.id)
    @active_categories = @categories.where(hide: [nil, false]).order(priority: :asc)
  end


  private

  def find_place
    @place = Place.find_by_slug!(params[:id])
  end

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
