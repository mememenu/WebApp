class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: :show
  before_action :validate_restaurant_owner_or_admin, except: [:show, :create, :update]
  before_action :check_hidden, only: :show

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @dishes = Dish.where(category_id: @category.id).reverse
    @dish = Dish.new
    @categories = Category.where(menu_id: @category.menu_id).reverse
  end

  # GET /categories/1/edit
  def edit
  end

  def new
    @category = Category.new
  end


  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)
    @menus = Menu.where(restaurant_id: @category.restaurant_id)
    @restaurant = Restaurant.find(@category.restaurant_id)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category.restaurant, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category.restaurant, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to @category.restaurant, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def check_hidden
      if @category.hide 
        if current_user
          unless current_user.admin || current_user.restaurant_id == @category.menu.restaurant.id
            redirect_to root_path
          end
        else
          redirect_to root_path
        end
      end
    end


    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :menu_id, :hide, :restaurant_id, :priority)
    end
end
