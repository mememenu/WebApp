class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: :show
  before_action :validate_restaurant_owner_or_admin, except: [:show, :create, :update]
  before_action :check_hidden, only: :show

  # GET /menus
  # GET /menus.json
  def index
    @menus = Menu.all
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
    @categories = Category.where(menu_id: @menu.id).reverse
    @category = Category.new
    @dishes = Dish.where(category_id: @menu.menu_categories)
  end

  # GET /menus/1/edit
  def edit
  end

  # POST /menus
  # POST /menus.json
  def create
    @menu = Menu.new(menu_params)
    @menu.restaurant_ids = params[:menu][:restaurant_ids]

    respond_to do |format|
      if @menu.save
        format.html { redirect_to @menu, notice: 'Menu was successfully created.' }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update
    @menu.restaurant_ids = params[:menu][:restaurant_ids]

    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to @menu, notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to menus_url, notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def check_hidden
      if @menu.hide 
        if current_user
          unless current_user.admin || current_user.restaurant_id == @menu.restaurants.first.id
            redirect_to root_path
          end
        else
          redirect_to root_path
        end
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:name, :description, :hide)
      # used to have :restaurant_id
    end
end
