class HomeController < ApplicationController
  
  def index
    @restaurants = Restaurant.where(hide: [nil, false])
  end

  def about
  end

  def contact
    @contact = Contact.new
  end

  def appstore
    render layout: "appstore_head"
  end

end
