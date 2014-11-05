require 'rails_helper'

RSpec.describe "DishIngredients", :type => :request do
  describe "GET /dish_ingredients" do
    it "works! (now write some real specs)" do
      get dish_ingredients_path
      expect(response).to have_http_status(200)
    end
  end
end
