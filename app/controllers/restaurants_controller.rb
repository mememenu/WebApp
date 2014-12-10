class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  before_action :validate_restaurant_owner_or_admin, except: [:show]
  before_action :check_hidden, only: :show

  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    @menu = Menu.new
    @menus = Menu.where(restaurant_id: @restaurant.id)
    @active_menus = @menus.where(hide: [nil, false]).order(priority: :asc)
    @inactive_menus = @menus.where(hide: true).order(:name)
    @category = Category.new
    @categories = Category.where(restaurant_id: @restaurant.id)
    @active_categories = @categories.where(hide: [nil, false]).order(priority: :asc)
    @inactive_categories = @categories.where(hide: true).order(:name)
    @dish = Dish.new
    @dishes = Dish.where(category_id: @restaurant.restaurant_categories)
    @active_dishes = @dishes.where(hide: [nil, false]).order(:menu_id, :category_id, :name)
    @inactive_dishes = @dishes.where(hide: true).order(:name)
    @ingredients = Ingredient.where(restaurant_id: @restaurant.id)
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.cuisine_ids = params[:restaurant][:cuisine_ids]
    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    @restaurant.cuisine_ids = params[:restaurant][:cuisine_ids]
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def check_hidden
      if @restaurant.hide 
        if current_user
          unless current_user.admin || current_user.restaurant_id == @restaurant.id
            redirect_to root_path
          end
        else
          redirect_to root_path
        end
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find_by_slug!(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :address_1, :address_2, :city, :state, :zipcode, :description, :phone, :dollars, :reservations, :hide, :avatar, :zone)
    end
end
