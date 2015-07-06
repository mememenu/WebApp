require 'rails_helper'

describe DishSerializer, type: :model do
  let(:restaurant_banner) { FactoryGirl.create(:restaurant_banner, :with_avatar) }
  let(:header) { FactoryGirl.create(:restaurant_header, :with_avatar) }
  let(:tile) { FactoryGirl.create(:restaurant_tile, :with_avatar) }
  let(:detailed_restaurant) do
    FactoryGirl.create(
      :restaurant,
      :with_avatar,
      name: 'My Restaurant',
      website: 'http://meme.menu.com',
      photographer_name: 'John Doe',
      photographer_media_link: 'http://john.doe.com',
      facebook: 'http://facebook.com/MyRestaurant',
      twitter: 'http://twitter.com/MyRestaurant',
      instagram: 'http://instagram.com/MyRestaurant',
      maps_url: 'http://maps.google.com/MyRestaurant',
      status: 'iOS Status Message',
      delivery_url: 'http://delivery.com/MyRestaurant',
      region: 'MIA',
      restaurant_banner: restaurant_banner,
      restaurant_header: header,
      restaurant_tile: tile,
      foursquare_id: '123'
    )
  end
  let(:detailed_dish) do
    FactoryGirl.create(
      :dish,
      restaurant: detailed_restaurant,
      name: 'My Dish',
      description: 'My Dish desc.',
      menu: FactoryGirl.create(:menu, name: 'My Menu'),
      category: FactoryGirl.create(:category, name: 'My Category')
    )
  end
  let(:basic_dish) { FactoryGirl.create(:dish) }

  describe 'attributes' do
    let(:serializer) { described_class.new(detailed_dish) }
    it 'delegates attributes to the dish' do
      expect(serializer.id).to eq(detailed_dish.id)
      expect(serializer.name).to eq('My Dish')
      expect(serializer.description).to eq('My Dish desc.')
    end
  end

  describe '#restaurant_banner' do
    let(:serializer) { described_class.new(detailed_dish) }
    it 'returns the url of the avatar' do
      expect(serializer.restaurant_banner).not_to be_nil
      expect(serializer.restaurant_banner.to_json).to eq(restaurant_banner.avatar.url.to_json)
    end
  end

  describe '#restaurant_name' do
    context 'detailed dish' do
      let(:serializer) { described_class.new(detailed_dish) }
      it { expect(serializer.restaurant_name).to eq('My Restaurant') }
    end
  end

  describe '#restaurant_avatar' do
    context 'detailed dish' do
      let(:serializer) { described_class.new(detailed_dish) }
      it { expect(serializer.restaurant_avatar.to_json).to eq(detailed_restaurant.avatar.url.to_json) }
    end
  end

  describe '#restaurant_zone' do
    context 'detailed dish' do
      let(:serializer) { described_class.new(detailed_dish) }
      it { expect(serializer.restaurant_zone).to eq('Miami Beach') }
    end
  end

  describe '#restaurant_city' do
    context 'detailed dish' do
      let(:serializer) { described_class.new(detailed_dish) }
      it { expect(serializer.restaurant_city).to eq('Miami') }
    end
  end

  describe '#restaurant_region' do
    context 'detailed dish' do
      let(:serializer) { described_class.new(detailed_dish) }
      it { expect(serializer.restaurant_region).to eq('MIA') }
    end

    context 'basic dish' do
      let(:serializer) { described_class.new(basic_dish) }
      it { expect(serializer.restaurant_region).to be_nil }
    end
  end

  describe '#menu_name' do
    context 'detailed dish' do
      let(:serializer) { described_class.new(detailed_dish) }
      it { expect(serializer.menu_name).to eq('My Menu') }
    end

    xcontext 'basic dish' do
      let(:serializer) { described_class.new(basic_dish) }
    end
  end

  describe '#category_name' do
    context 'detailed dish' do
      let(:serializer) { described_class.new(detailed_dish) }
      it { expect(serializer.category_name).to eq('My Category') }
    end

    xcontext 'basic dish' do
      let(:serializer) { described_class.new(basic_dish) }
    end
  end

  describe '#website' do
    context 'detailed dish' do
      let(:serializer) { described_class.new(detailed_dish) }
      it { expect(serializer.website).to eq('http://meme.menu.com') }
    end

    context 'basic dish' do
      let(:serializer) { described_class.new(basic_dish) }
      it { expect(serializer.website).to be_nil }
    end
  end

  describe '#photographer_name' do
    context 'detailed dish' do
      let(:serializer) { described_class.new(detailed_dish) }
      it { expect(serializer.photographer_name).to eq('John Doe') }
    end

    context 'basic dish' do
      let(:serializer) { described_class.new(basic_dish) }
      it { expect(serializer.photographer_name).to be_nil }
    end
  end

  describe '#photographer_media_link' do
    context 'detailed dish' do
      let(:serializer) { described_class.new(detailed_dish) }
      it { expect(serializer.photographer_media_link).to eq('http://john.doe.com') }
    end

    context 'basic dish' do
      let(:serializer) { described_class.new(basic_dish) }
      it { expect(serializer.photographer_media_link).to be_nil }
    end
  end

  describe '#facebook' do
    context 'detailed dish' do
      let(:serializer) { described_class.new(detailed_dish) }
      it { expect(serializer.facebook).to eq('http://facebook.com/MyRestaurant') }
    end

    context 'basic dish' do
      let(:serializer) { described_class.new(basic_dish) }
      it { expect(serializer.facebook).to be_nil }
    end
  end

  describe '#twitter' do
    context 'detailed dish' do
      let(:serializer) { described_class.new(detailed_dish) }
      it { expect(serializer.twitter).to eq('http://twitter.com/MyRestaurant') }
    end

    context 'basic dish' do
      let(:serializer) { described_class.new(basic_dish) }
      it { expect(serializer.twitter).to be_nil }
    end
  end

  describe '#instagram' do
    context 'detailed dish' do
      let(:serializer) { described_class.new(detailed_dish) }
      it { expect(serializer.instagram).to eq('http://instagram.com/MyRestaurant') }
    end

    context 'basic dish' do
      let(:serializer) { described_class.new(basic_dish) }
      it { expect(serializer.instagram).to be_nil }
    end
  end

  describe '#cloud_front' do
    context 'detailed dish' do
      let(:serializer) { described_class.new(detailed_dish) }
      it { expect(serializer.cloud_front).to eq(detailed_dish.cloud_front) }
    end
  end

  describe '#maps_url' do
    context 'detailed dish' do
      let(:serializer) { described_class.new(detailed_dish) }
      it { expect(serializer.maps_url).to eq('http://maps.google.com/MyRestaurant') }
    end
  end

  describe '#address_1' do
    context 'detailed dish' do
      let(:serializer) { described_class.new(detailed_dish) }
      it { expect(serializer.address_1).to eq('123 Test St.') }
    end
  end

  describe '#state' do
    context 'detailed dish' do
      let(:serializer) { described_class.new(detailed_dish) }
      it { expect(serializer.state).to eq('FL') }
    end
  end

  describe '#zipcode' do
    context 'detailed dish' do
      let(:serializer) { described_class.new(detailed_dish) }
      it { expect(serializer.zipcode).to eq('12345') }
    end
  end

  describe '#lat' do
    context 'detailed dish' do
      let(:serializer) { described_class.new(detailed_dish) }
      it { expect(serializer.lat).to eq(25.7982813) }
    end
  end

  describe '#long' do
    context 'detailed dish' do
      let(:serializer) { described_class.new(detailed_dish) }
      it { expect(serializer.long).to eq(-80.1283682) }
    end
  end

  describe '#phone' do
    context 'detailed dish' do
      let(:serializer) { described_class.new(detailed_dish) }
      it { expect(serializer.phone).to eq('0123456789') }
    end
  end

  describe '#slug' do
    context 'detailed dish' do
      let(:serializer) { described_class.new(detailed_dish) }
      it { expect(serializer.slug).to eq(detailed_restaurant.slug) }
    end
  end

  describe '#restaurant_header' do
    context 'detailed dish' do
      let(:serializer) { described_class.new(detailed_dish) }
      it { expect(serializer.restaurant_header.to_json).to eq(header.avatar.url.to_json) }
    end

    context 'basic dish' do
      let(:serializer) { described_class.new(basic_dish) }
      it { expect(serializer.restaurant_header).to be false }
    end
  end

  describe '#city' do
    context 'detailed dish' do
      let(:serializer) { described_class.new(detailed_dish) }
      it { expect(serializer.restaurant_city).to eq('Miami') }
    end
  end

  describe '#menu_id' do
    context 'detailed dish' do
      let(:serializer) { described_class.new(detailed_dish) }
      it { expect(serializer.menu_id).to eq(detailed_dish.menu.priority) }
    end
  end

  describe '#delivery_url' do
    context 'detailed dish' do
      let(:serializer) { described_class.new(detailed_dish) }
      it { expect(serializer.delivery_url).to eq('http://delivery.com/MyRestaurant') }
    end

    context 'basic dish' do
      let(:serializer) { described_class.new(basic_dish) }
      it { expect(serializer.delivery_url).to be_nil }
    end
  end

  describe '#foursquare_id' do
    context 'detailed dish' do
      let(:serializer) { described_class.new(detailed_dish) }
      it { expect(serializer.foursquare_id).to eq('123') }
    end
  end

  describe '#status' do
    context 'detailed dish' do
      let(:serializer) { described_class.new(detailed_dish) }
      it { expect(serializer.status).to eq('iOS Status Message') }
    end

    context 'basic dish' do
      let(:serializer) { described_class.new(basic_dish) }
      it { expect(serializer.status).to be_nil }
    end
  end
end
