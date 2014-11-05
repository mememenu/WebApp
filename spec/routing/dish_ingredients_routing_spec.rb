require "rails_helper"

RSpec.describe DishIngredientsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/dish_ingredients").to route_to("dish_ingredients#index")
    end

    it "routes to #new" do
      expect(:get => "/dish_ingredients/new").to route_to("dish_ingredients#new")
    end

    it "routes to #show" do
      expect(:get => "/dish_ingredients/1").to route_to("dish_ingredients#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/dish_ingredients/1/edit").to route_to("dish_ingredients#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/dish_ingredients").to route_to("dish_ingredients#create")
    end

    it "routes to #update" do
      expect(:put => "/dish_ingredients/1").to route_to("dish_ingredients#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/dish_ingredients/1").to route_to("dish_ingredients#destroy", :id => "1")
    end

  end
end
