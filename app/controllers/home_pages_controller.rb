class HomePagesController < ApplicationController
  def edit
    @home_page = HomePage.find_by_id(params[:id]) || HomePage.last
  end

  def update
    @home_page = HomePage.find_by_id(params[:id])

    featured_list = List.find_by_id(permitted_params[:featured_list])
    @home_page.featured_list = featured_list

    lists = List.where(id: permitted_params[:generic_lists_ids])
    @home_page.generic_lists = lists

    lists = List.where(id: permitted_params[:contributor_lists_ids])
    @home_page.contributor_lists = lists

    if @home_page.save
      redirect_to edit_home_page_path(@home_page)
    else
      redirect_to edit_home_page_path(@home_page), flash: { notice: "An error has ocurred. " }
    end
  end

  private

  def permitted_params
    params.require(:home_page).permit(:featured_list, generic_lists_ids: [], contributor_lists_ids: [])
  end
end
