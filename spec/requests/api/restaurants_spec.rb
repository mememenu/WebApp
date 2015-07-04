require 'rails_helper'

RSpec.describe 'Restaurants API', type: :request do
  before do
    FactoryGirl.create_list(:restaurant, 2, region: 'MIA', hide: false)
    FactoryGirl.create_list(:restaurant, 2, region: 'NOLA', hide: false)
  end

  describe '#restaurant_info' do
    it 'returns a list of restaurants that are not hidden' do
      FactoryGirl.create(:restaurant, hide: true)
      get '/ios/restaurant_info', format: :json

      expect(response).to be_success
      expect(json.length).to eq(4)
      expect(response).to render_template('ios/restaurant_info')
    end
  end

  describe '#miami_restaurants_list' do
    it 'returns a list of restaurants in Miami that are not hidden' do
      FactoryGirl.create(:restaurant, hide: true, region: 'MIA')
      get '/ios/miami_restaurants_list', format: :json

      expect(response).to be_success
      expect(json.length).to eq(2)
      expect(response).to render_template('ios/miami_restaurants_list')
    end
  end

  describe '#nola_restaurants_list' do
    it 'returns a list of restaurants in Nola that are not hidden' do
      FactoryGirl.create(:restaurant, hide: true, region: 'NOLA')
      get '/ios/nola_restaurants_list', format: :json

      expect(response).to be_success
      expect(json.length).to eq(2)
      expect(response).to render_template('ios/nola_restaurants_list')
    end
  end
end
