require 'rails_helper'

RSpec.describe 'Categories API', type: :request do
  let(:category1) { FactoryGirl.create(:category, hide: false, name: 'Cat 1') }
  let(:category2) { FactoryGirl.create(:category, hide: false, name: 'Cat 2') }

  let(:restaurant) do
    FactoryGirl.create(
      :restaurant,
      categories: [category1, category2]
    )
  end

  describe '#category_info' do
    it 'returns a list of the categories of the restaurant that are not hidden' do
      FactoryGirl.create(:category, hide: true, restaurant: restaurant)

      get "/ios/category_info/#{restaurant.slug}.json"

      expect(response).to be_success
      expect(json.length).to eq(2)
      expect(json).to be_an_instance_of(Array)
      expect(response).to render_template('ios/category_info')

      json_category1, json_category2 = *json
      expect(json_category1['id']).to eq(category1.id)
      expect(json_category1['name']).to eq('Cat 1')
      expect(json_category1['menu_id']).to eq(category1.menu_id)
      expect(json_category2['id']).to eq(category2.id)
      expect(json_category2['name']).to eq('Cat 2')
      expect(json_category2['menu_id']).to eq(category2.menu_id)
    end
  end
end
