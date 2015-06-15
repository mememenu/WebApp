require 'rails_helper'

describe DishSerializer, type: :model do
  let(:restaurant_banner) { FactoryGirl.create(:restaurant_banner, :with_avatar) }
  let(:restaurant) { FactoryGirl.create(:restaurant, restaurant_banner: restaurant_banner) }
  let(:dish) { FactoryGirl.create(:dish, restaurant: restaurant) }
  let(:serializer) { DishSerializer.new(dish) }

  describe '#restaurant_banner' do
    it 'returns the url of the avatar' do
      expect(serializer.restaurant_banner).not_to be_nil
      expect(serializer.restaurant_banner.to_json).to eq(restaurant_banner.avatar.url.to_json)
    end
  end
end
