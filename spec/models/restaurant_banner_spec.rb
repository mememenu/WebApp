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
        restaurant_banner = FactoryGirl.build(:restaurant_banner, avatar: invalid_pic)

        expect(restaurant_banner).not_to be_valid
        expect(restaurant_banner.errors[:avatar_dimension]).to eq(['is too small.'])
      end

      it 'is valid if the image is bigger than 750x280' do
        restaurant_banner = FactoryGirl.build(:restaurant_banner, :with_avatar)

        expect(restaurant_banner).to be_valid
      end
    end
  end
end
