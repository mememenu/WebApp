require "rails_helper"

RSpec.describe DishCategoriesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/dish_categories").to route_to("dish_categories#index")
    end

    it "routes to #new" do
      expect(:get => "/dish_categories/new").to route_to("dish_categories#new")
    end

    it "routes to #show" do
      expect(:get => "/dish_categories/1").to route_to("dish_categories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/dish_categories/1/edit").to route_to("dish_categories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/dish_categories").to route_to("dish_categories#create")
    end

    it "routes to #update" do
      expect(:put => "/dish_categories/1").to route_to("dish_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/dish_categories/1").to route_to("dish_categories#destroy", :id => "1")
    end

  end
end
