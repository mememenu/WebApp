class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  before_action :validate_place_owner_or_admin, except: [:show]
  before_action :validate_admin, only: :edit
  before_action :check_hidden, only: :show

  # GET /places
  # GET /places.json
  def index
    @places = Place.order(name: :asc)
  end

  # GET /places/1
  # GET /places/1.json
  def show
    @menu = Menu.new
    @menus = Menu.where(place_id: @place.id)
    @active_menus = @menus.where(hide: [nil, false]).order(priority: :asc)
    @inactive_menus = @menus.where(hide: true).order(:name)
    @category = Category.new
    @categories = Category.where(place_id: @place.id)
    @active_categories = @categories.where(hide: [nil, false]).order(priority: :asc)
    @inactive_categories = @categories.where(hide: true).order(:name)
    @dish = Dish.new
    @dishes = Dish.where(category_id: @place.place_categories)
    @active_dishes = @dishes.where(hide: [nil, false]).order(:menu_id, :category_id, :name)
    @inactive_dishes = @dishes.where(hide: true).order(:name)
  end

  # GET /places/new
  def new
    @place = Place.new
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params)
    respond_to do |format|
      if @place.save
        format.html { redirect_to @place, notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /places/1/edit
  def edit
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def check_hidden
    if @place.hide
      if current_user
        unless current_user.admin || current_user.place_id == @place.id
          redirect_to root_path
        end
      else
        redirect_to root_path
      end
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_place
    @place = Place.find_by_slug!(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def place_params
    params.require(:place).permit(
      :name, :address_1, :address_2, :city, :state, :zipcode, :description, :phone,
      :dollars, :reservations, :hide, :avatar, :zone, :region, :website, :price,
      :photographer_name, :photographer_media_link, :clean_name,
      :facebook, :twitter, :instagram, :delivery_url, :foursquare_id, :status, :google_id,
      tile_attributes: [:id, :avatar, :place_id],
      header_attributes: [:id, :avatar, :place_id],
      banner_attributes: [:id, :avatar, :place_id]
    )
  end
end
