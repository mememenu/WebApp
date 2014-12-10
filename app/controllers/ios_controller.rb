class IosController < ApplicationController

  def restaurant_info
    @restaurants = Restaurant.where(hide: [nil, false])
  end

end
