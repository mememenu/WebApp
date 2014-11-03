require 'rails_helper'

RSpec.describe "DishCategories", :type => :request do
  describe "GET /dish_categories" do
    it "works! (now write some real specs)" do
      get dish_categories_path
      expect(response).to have_http_status(200)
    end
  end
end
