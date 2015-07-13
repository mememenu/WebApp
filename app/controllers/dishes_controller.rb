class DishesController < ApplicationController
  before_action :set_dish, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: :show
  before_action :validate_restaurant_owner_or_admin, except: [:show, :create, :update]
  before_action :check_hidden, only: :show

  # GET /dishes
  # GET /dishes.json
  def index
    @dishes = Dish.all
  end

  # GET /dishes/1
  # GET /dishes/1.json
  def show
    @images = Image.where(dish_id: @dish.id)
    @image = Image.new
  end

  def new
    @dish = Dish.new
  end

  # GET /dishes/1/edit
  def edit
    @restaurant = Restaurant.find(@dish.restaurant.id)
    @menus = Menu.where(restaurant_id: @dish.restaurant_id)
  end

  # POST /dishes
  # POST /dishes.json
  def create
    @dish = Dish.new(dish_params)
    @menus = Menu.where(restaurant_id: @dish.restaurant_id)
    @restaurant = Restaurant.find(@dish.restaurant_id)

    respond_to do |format|
      if @dish.save
        format.html { redirect_to @dish.restaurant, notice: 'Dish was successfully created.' }
        format.json { render :show, status: :created, location: @dish }
      else
        format.html { render :new }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dishes/1
  # PATCH/PUT /dishes/1.json
  def update
    respond_to do |format|
      if @dish.update_attributes(dish_params)
        format.html { redirect_to @dish.restaurant, notice: 'Dish was successfully updated.' }
        format.json { render :show, status: :ok, location: @dish }
      else
        format.html { render :edit }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dishes/1
  # DELETE /dishes/1.json
  def destroy
    @dish.destroy
    respond_to do |format|
      format.html { redirect_to @dish.restaurant, notice: 'Dish was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def check_hidden
    if @dish.hide
      if current_user
        unless current_user.admin || current_user.restaurant_id == @dish.category.menu.restaurant.id
          redirect_to root_path
        end
      else
        redirect_to root_path
      end
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_dish
    @dish = Dish.find(params[:id])
    @restaurant = @dish.restaurant
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def dish_params
    params.require(:dish).permit(
      :name, :description, :portion_size, :spice, :hot, :gluten_free, :vegetarian,
      :category_id, :hide, :avatar, :menu_id, :restaurant_id, :cloud_front,
      default_image_attributes: [:avatar, :dish_id, :destroy, :default, :id],
      additional_images_attributes: [:avatar, :id, :_destroy]
    )
  end
end
