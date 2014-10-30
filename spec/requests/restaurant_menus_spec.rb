require 'rails_helper'

RSpec.describe "RestaurantMenus", :type => :request do
  describe "GET /restaurant_menus" do
    it "works! (now write some real specs)" do
      get restaurant_menus_path
      expect(response).to have_http_status(200)
    end
  end
end
