class HomeController < ApplicationController
  
  def index
    @restaurants = Restaurant.all
  end

  def about
  end

  def contact
  end

end
