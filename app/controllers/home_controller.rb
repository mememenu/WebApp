class HomeController < ApplicationController
  def index
    @places = Place.where(hide: [nil, false])
  end

  def about
  end

  def contact
    @contact = Contact.new
  end

  def appstore
    @contact = Contact.new
    render layout: "appstore_head"
  end

end
