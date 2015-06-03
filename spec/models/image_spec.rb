require 'rails_helper'

RSpec.describe Image, :type => :model do
  before do
    @image = FactoryGirl.create(:image)
    @dish = @image.dish
    @restaurant = @dish.restaurant
  end

  it "should be destroyed if corresponding dish is destroyed" do
    @dish.destroy

    expect(Dish.count).to eq(0)
    expect(Image.count).to eq(0)
  end

  it "should be destroyed if corresponding restaurant is destroyed" do
    @restaurant.destroy

    expect(Image.count).to be_zero
  end

  it "should become hidden if corresponding dish becomes hidden" do
    @dish.hide = true
    @dish.save
    @dish.reload
    @image.reload

    expect(@image.hide).to eq(@dish.hide)
  end

  it "should become unhidden is corresponding dish becomes unhidden" do
    @dish.hide = true
    @dish.save
    @dish.reload
    @image.reload

    expect(@image.hide).to eq(@dish.hide)

    @dish.hide = false
    @dish.save
    @dish.reload
    @image.reload

    expect(@image.hide).to eq(@dish.hide)
  end

  it "should become hidden if corresponding restaurant becomes hidden" do
    @restaurant.hide = true
    @restaurant.save
    @restaurant.reload
    @image.reload

    expect(@image.hide).to eq(@restaurant.hide)
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
end
