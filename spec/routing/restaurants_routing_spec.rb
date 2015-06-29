require "rails_helper"

RSpec.describe RestaurantsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/restaurants").to route_to("restaurants#index")
    end

    it "routes to #new" do
      expect(:get => "/restaurants/new").to route_to("restaurants#new")
    end

    it "routes to #create" do
      expect(:post => "/restaurants").to route_to("restaurants#create")
    end
  end
end
