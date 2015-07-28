require 'rails_helper'

RSpec.describe Image, :type => :model do
  before do
    @image = FactoryGirl.create(:image)
    @dish = @image.dish
    @place = @dish.place
  end

  it "should be destroyed if corresponding dish is destroyed" do
    @dish.destroy

    expect(Dish.count).to eq(0)
    expect(Image.count).to eq(0)
  end

  it "should be destroyed if corresponding place is destroyed" do
    @place.destroy

    expect(Image.count).to be_zero
  end

  it "should become hidden if corresponding dish becomes hidden" do
    @image.update_attributes(hide: false)
    @dish.update_attributes(hide: true)

    expect(@image.reload.hide).to be_truthy
  end

  it "should become unhidden is corresponding dish becomes unhidden" do
    @image.update_attributes(hide: true)
    @dish.update_attributes(hide: false)

    expect(@image.reload.hide).to be_falsy
  end

  it "should become hidden if corresponding place becomes hidden" do
    @place.update_attributes(hide: true)

    expect(@image.reload.hide).to be_truthy
  end

  it "sets cloudfront_url after saving the image" do
    allow_any_instance_of(Paperclip::Attachment).
      to receive(:url).and_return("http://s3.amazonaws.com/meme-menu/original/image.png")
    image = FactoryGirl.create(:image)

    expect(image.cloudfront_url).to include("http://dm7g4xbxa7ld3.cloudfront.net")
    expect(image.cloudfront_url).not_to include("http://s3.amazonaws.com/meme-menu")
    expect(image.cloudfront_url).to include("large")
    expect(image.cloudfront_url).not_to include("original")
  end

  describe 'validations' do
    describe 'Validate image dimension' do
      it 'is invalid if the image is smaller than 700x700' do
        invalid_pic = File.new(fixture_file_upload('/images/430x505.jpeg', 'image/jpeg'))
        image = FactoryGirl.build(:image, avatar: invalid_pic)

        expect(image).not_to be_valid
        expect(image.errors[:avatar_dimension]).to eq(['is too small.'])
      end

      it 'is valid if the avatar is bigger than 648x648' do
        valid_pic = FactoryGirl.build(:image, :with_avatar)

        expect(valid_pic).to be_valid
      end
    end
  end
end
