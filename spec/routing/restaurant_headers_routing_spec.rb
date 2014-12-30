require "rails_helper"

RSpec.describe RestaurantHeadersController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/restaurant_headers").to route_to("restaurant_headers#index")
    end

    it "routes to #new" do
      expect(:get => "/restaurant_headers/new").to route_to("restaurant_headers#new")
    end

    it "routes to #show" do
      expect(:get => "/restaurant_headers/1").to route_to("restaurant_headers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/restaurant_headers/1/edit").to route_to("restaurant_headers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/restaurant_headers").to route_to("restaurant_headers#create")
    end

    it "routes to #update" do
      expect(:put => "/restaurant_headers/1").to route_to("restaurant_headers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/restaurant_headers/1").to route_to("restaurant_headers#destroy", :id => "1")
    end

  end
end
