class ListsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :validate_admin
  before_filter :set_list, only: [:update, :edit, :destroy]

  def index
    @lists = List.all
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to lists_url, notice: 'List was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to lists_url, notice: 'List was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @list.destroy

    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :kind, :avatar, :hide, place_ids: [])
  end
end
