class HomeController < ApplicationController
  
  def index
    @restaurants = Restaurant.all
  end

  def about
  end

  def contact
    @contact = Contact.new
  end

end
