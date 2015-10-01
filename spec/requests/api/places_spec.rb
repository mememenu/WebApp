require 'rails_helper'

RSpec.describe 'Places API', type: :request do
  before do
    FactoryGirl.create_list(:place, 2, region: 'MIA', hide: false)
    FactoryGirl.create_list(:place, 2, region: 'NOLA', hide: false)
  end

  describe '#miami_places_list' do
    it 'returns a list of places in Miami that are not hidden' do
      FactoryGirl.create(:place, hide: true, region: 'MIA')
      get '/ios/miami_restaurants_list', format: :json

      expect(response).to be_success
      expect(json.length).to eq(2)
      expect(response).to render_template('ios/miami_places_list')
    end
  end
end
