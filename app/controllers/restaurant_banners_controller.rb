class RestaurantBannersController < ApplicationController
  before_action :set_restaurant_banner, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: :show
  before_action :validate_restaurant_owner_or_admin, except: [:show, :create, :update]
  
  # GET /restaurant_banners
  # GET /restaurant_banners.json
  def index
    @restaurant_banners = RestaurantBanner.all
  end

  # GET /restaurant_banners/1
  # GET /restaurant_banners/1.json
  def show
  end

  # GET /restaurant_banners/new
  def new
    @restaurant_banner = RestaurantBanner.new
  end

  # GET /restaurant_banners/1/edit
  def edit
  end

  # POST /restaurant_banners
  # POST /restaurant_banners.json
  def create
    @restaurant_banner = RestaurantBanner.new(restaurant_banner_params)

    respond_to do |format|
      if @restaurant_banner.save
        format.html { redirect_to @restaurant_banner, notice: 'Restaurant banner was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant_banner }
      else
        format.html { render :new }
        format.json { render json: @restaurant_banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurant_banners/1
  # PATCH/PUT /restaurant_banners/1.json
  def update
    respond_to do |format|
      if @restaurant_banner.update(restaurant_banner_params)
        format.html { redirect_to @restaurant_banner, notice: 'Restaurant banner was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant_banner }
      else
        format.html { render :edit }
        format.json { render json: @restaurant_banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurant_banners/1
  # DELETE /restaurant_banners/1.json
  def destroy
    @restaurant_banner.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_banners_url, notice: 'Restaurant banner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant_banner
      @restaurant_banner = RestaurantBanner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_banner_params
      params.require(:restaurant_banner).permit(:restaurant_id, :avatar)
    end
end
