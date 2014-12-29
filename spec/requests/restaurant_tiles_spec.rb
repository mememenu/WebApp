require 'rails_helper'

RSpec.describe "RestaurantTiles", :type => :request do
  describe "GET /restaurant_tiles" do
    it "works! (now write some real specs)" do
      get restaurant_tiles_path
      expect(response).to have_http_status(200)
    end
  end
end
