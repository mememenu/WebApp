class RestaurantHeadersController < ApplicationController
  before_action :set_restaurant_header, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  before_action :validate_restaurant_owner_or_admin, except: [:show]

  # GET /restaurant_headers
  # GET /restaurant_headers.json
  def index
    @restaurant_headers = RestaurantHeader.all
  end

  # GET /restaurant_headers/1
  # GET /restaurant_headers/1.json
  def show
  end

  # GET /restaurant_headers/new
  def new
    @restaurant_header = RestaurantHeader.new
  end

  # GET /restaurant_headers/1/edit
  def edit
  end

  # POST /restaurant_headers
  # POST /restaurant_headers.json
  def create
    @restaurant_header = RestaurantHeader.new(restaurant_header_params)

    respond_to do |format|
      if @restaurant_header.save
        format.html { redirect_to @restaurant_header, notice: 'Restaurant header was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant_header }
      else
        format.html { render :new }
        format.json { render json: @restaurant_header.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurant_headers/1
  # PATCH/PUT /restaurant_headers/1.json
  def update
    respond_to do |format|
      if @restaurant_header.update(restaurant_header_params)
        format.html { redirect_to @restaurant_header, notice: 'Restaurant header was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant_header }
      else
        format.html { render :edit }
        format.json { render json: @restaurant_header.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurant_headers/1
  # DELETE /restaurant_headers/1.json
  def destroy
    @restaurant_header.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_headers_url, notice: 'Restaurant header was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant_header
      @restaurant_header = RestaurantHeader.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_header_params
      params.require(:restaurant_header).permit(:restaurant_id)
    end
end
