require "rails_helper"

RSpec.describe RestaurantTilesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/restaurant_tiles").to route_to("restaurant_tiles#index")
    end

    it "routes to #new" do
      expect(:get => "/restaurant_tiles/new").to route_to("restaurant_tiles#new")
    end

    it "routes to #show" do
      expect(:get => "/restaurant_tiles/1").to route_to("restaurant_tiles#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/restaurant_tiles/1/edit").to route_to("restaurant_tiles#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/restaurant_tiles").to route_to("restaurant_tiles#create")
    end

    it "routes to #update" do
      expect(:put => "/restaurant_tiles/1").to route_to("restaurant_tiles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/restaurant_tiles/1").to route_to("restaurant_tiles#destroy", :id => "1")
    end

  end
end
