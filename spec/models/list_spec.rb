require 'rails_helper'

describe List, type: :model do
  it { should validate_presence_of(:name) }

  describe 'validations' do
    it "validates that avatar is present" do
      list = FactoryGirl.build(:generic_list, avatar: nil)

      expect(list).not_to be_valid
    end

    describe 'Validate image dimension' do
      it 'is invalid if it is smaller than 648x648' do
        invalid_pic = fixture_file_upload('/images/430x505.jpeg', 'image/jpeg')
        list = FactoryGirl.build(:generic_list, avatar: invalid_pic)

        expect(list).not_to be_valid
        expect(list.errors["avatar_dimension"]).to eq(['is too small.'])
      end

      it 'is valid if is bigger than 750x400' do
        list = FactoryGirl.build(:generic_list)

        expect(list).to be_valid
      end
    end
  end

  it "sets cloudfront_url after saving the list" do
    allow_any_instance_of(Paperclip::Attachment).
      to receive(:url).and_return("http://s3.amazonaws.com/test/original/image.png")
    list = FactoryGirl.create(:generic_list)

    expect(list.cloudfront_url).to include("http://xxx.cloudfront.net")
    expect(list.cloudfront_url).not_to include("http://s3.amazonaws.com/meme-menu")
    expect(list.cloudfront_url).to include("large")
    expect(list.cloudfront_url).not_to include("original")
  end
end
