require 'rails_helper'

describe RestaurantBanner, type: :model do
  describe 'it has an avatar with different dimensions' do
    let(:banner) { FactoryGirl.create(:restaurant_banner) }

    it { expect(banner.avatar).not_to be_nil }
  end

  describe 'validations' do
    describe 'Validate avatar dimension' do
      it 'is invalid if the image is smaller than 750x280' do
        invalid_pic = File.new(fixture_file_upload('/images/430x505.jpeg', 'image/jpeg'))
        dish = FactoryGirl.build(:restaurant_banner, avatar: invalid_pic)

        expect(dish).not_to be_valid
        expect(dish.errors[:avatar_dimension]).to eq(['is too small.'])
      end

      it 'is valid if the image is bigger than 750x280' do
        dish_with_avatar = FactoryGirl.build(:restaurant_banner, :with_avatar)

        expect(dish_with_avatar).to be_valid
      end
    end
  end
end
