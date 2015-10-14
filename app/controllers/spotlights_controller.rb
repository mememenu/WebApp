class SpotlightsController < ApplicationController
  def edit
    @spotlight = Spotlight.find_by_id(params[:id])
  end

  def update
    @spotlight = Spotlight.find_by_id(params[:id])
    spotlight_items = params[:spotlight_items]
    to_keep = []

    spotlight_items.each do |position, values|
      if values[:type].constantize.find_by_id(values[:id])
        spotlight_item = @spotlight.spotlight_items.find_or_initialize_by(
          spotable_id: values[:id],
          spotable_type: values[:type]
        )

        spotlight_item.position = position
        spotlight_item.save
        to_keep << spotlight_item.id
      end
    end

    if @spotlight.save
      @spotlight.spotlight_items.where.not(id: to_keep).destroy_all
      redirect_to edit_home_page_path(@spotlight.home_page)
    else
      redirect_to edit_spotlight_path(@spotlight), flash: { notice: "An error has ocurred. " }
    end
  end
end
