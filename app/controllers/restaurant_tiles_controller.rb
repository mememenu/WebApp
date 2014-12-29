class RestaurantTilesController < ApplicationController
  before_action :set_restaurant_tile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: :show
  before_action :validate_restaurant_owner_or_admin, except: [:show, :create, :update]
  
  # GET /restaurant_tiles
  # GET /restaurant_tiles.json
  def index
    @restaurant_tiles = RestaurantTile.all
  end

  # GET /restaurant_tiles/1
  # GET /restaurant_tiles/1.json
  def show
  end

  # GET /restaurant_tiles/new
  def new
    @restaurant_tile = RestaurantTile.new
  end

  # GET /restaurant_tiles/1/edit
  def edit
  end

  # POST /restaurant_tiles
  # POST /restaurant_tiles.json
  def create
    @restaurant_tile = RestaurantTile.new(restaurant_tile_params)

    respond_to do |format|
      if @restaurant_tile.save
        format.html { redirect_to @restaurant_tile, notice: 'Restaurant tile was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant_tile }
      else
        format.html { render :new }
        format.json { render json: @restaurant_tile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurant_tiles/1
  # PATCH/PUT /restaurant_tiles/1.json
  def update
    respond_to do |format|
      if @restaurant_tile.update(restaurant_tile_params)
        format.html { redirect_to @restaurant_tile, notice: 'Restaurant tile was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant_tile }
      else
        format.html { render :edit }
        format.json { render json: @restaurant_tile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurant_tiles/1
  # DELETE /restaurant_tiles/1.json
  def destroy
    @restaurant_tile.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_tiles_url, notice: 'Restaurant tile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant_tile
      @restaurant_tile = RestaurantTile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_tile_params
      params.require(:restaurant_tile).permit(:restaurant_id, :avatar)
    end
end
