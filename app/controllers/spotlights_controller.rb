class SpotlightsController < ApplicationController
  def edit
    @spotlight = Spotlight.find_by_id(params[:id])
  end

  def update
    @spotlight = Spotlight.find_by_id(params[:id])
  end
end
