require 'rails_helper'

RSpec.describe "RestaurantHeaders", :type => :request do
  describe "GET /restaurant_headers" do
    it "works! (now write some real specs)" do
      get restaurant_headers_path
      expect(response).to have_http_status(200)
    end
  end
end
