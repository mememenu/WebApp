require 'rails_helper'

describe Banner, type: :model do
  describe 'it has an avatar with different dimensions' do
    let(:banner) { FactoryGirl.create(:banner) }

    it { expect(banner.avatar).not_to be_nil }
  end

  describe 'validations' do
    describe 'Validate avatar dimension' do
      it 'is invalid if the image is smaller than 750x280' do
        invalid_pic = File.new(fixture_file_upload('/images/430x505.jpeg', 'image/jpeg'))
        banner = FactoryGirl.build(:banner, avatar: invalid_pic)

        expect(banner).not_to be_valid
        expect(banner.errors[:avatar_dimension]).to eq(['is too small.'])
      end

      it 'is valid if the image is bigger than 750x280' do
        banner = FactoryGirl.build(:banner, :with_avatar)

        expect(banner).to be_valid
      end
    end
  end
end
