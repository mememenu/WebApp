require "rails_helper"

RSpec.describe RestaurantMenusController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/restaurant_menus").to route_to("restaurant_menus#index")
    end

    it "routes to #new" do
      expect(:get => "/restaurant_menus/new").to route_to("restaurant_menus#new")
    end

    it "routes to #show" do
      expect(:get => "/restaurant_menus/1").to route_to("restaurant_menus#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/restaurant_menus/1/edit").to route_to("restaurant_menus#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/restaurant_menus").to route_to("restaurant_menus#create")
    end

    it "routes to #update" do
      expect(:put => "/restaurant_menus/1").to route_to("restaurant_menus#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/restaurant_menus/1").to route_to("restaurant_menus#destroy", :id => "1")
    end

  end
end
