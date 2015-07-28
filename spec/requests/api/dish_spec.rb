require 'rails_helper'

RSpec.describe 'Dishes API', type: :request do
  let(:dish1) do
    FactoryGirl.create(:dish, :with_default_image, hide: false, name: 'Dish 1', description: 'Dish 1 desc.')
  end
  let(:dish2) do
    FactoryGirl.create(:dish, :with_default_image, hide: false, name: 'Dish 2', description: 'Dish 2 desc.')
  end
  let(:place) do
    FactoryGirl.create(
      :place,
      dishes: [dish1, dish2]
    )
  end

  describe '#dish_info' do
    it 'returns a list of the dishes of the place that are not hidden' do
      FactoryGirl.create(:dish, hide: true, place: place)

      get "/ios/dish_info/#{place.slug}.json"

      expect(response).to be_success
      expect(json.length).to eq(2)
      expect(json).to be_an_instance_of(Array)
      expect(response).to render_template('ios/dish_info')

      json_dish1, json_dish2 = *json
      expect(json_dish1['name']).to eq('Dish 1')
      expect(json_dish1['category_id']).to eq(dish1.category_id)
      expect(json_dish1['description']).to eq('Dish 1 desc.')
      expect(json_dish1['avatar']).to eq(dish1.default_image.avatar.url)
      expect(json_dish1['cloud_front']).to eq(dish1.default_image.cloudfront_url)

      expect(json_dish2['name']).to eq('Dish 2')
      expect(json_dish2['category_id']).to eq(dish2.category_id)
      expect(json_dish2['description']).to eq('Dish 2 desc.')
      expect(json_dish2['avatar']).to eq(dish2.default_image.avatar.url)
      expect(json_dish2['cloud_front']).to eq(dish2.default_image.cloudfront_url)
    end
  end

  describe '#paginated_dish_feed' do
    it 'returns a paginated list of dishes that are not hidden, 10 per page' do
      FactoryGirl.create_list(:dish, 12, hide: false)
      FactoryGirl.create(:dish, hide: true)

      get '/ios/paginated_dish_feed.json'

      expect(response).to be_success
      expect(json.length).to eq(10)
    end
  end
end
