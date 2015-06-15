require 'rails_helper'

describe RestaurantBanner, type: :model do
  describe 'it has an avatar with different dimensions' do
    let(:banner) { FactoryGirl.create(:restaurant_banner) }

    it { expect(banner.avatar).not_to be_nil }
  end
end
