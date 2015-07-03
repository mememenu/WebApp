require 'rails_helper'

RSpec.describe 'ios/_base_restaurant.json.jbuilder', type: :view do
  let(:banner) { FactoryGirl.create(:restaurant_banner, :with_avatar) }
  let(:header) { FactoryGirl.create(:restaurant_header, :with_avatar) }
  let(:tile) { FactoryGirl.create(:restaurant_tile, :with_avatar) }
  let(:restaurant) do
    FactoryGirl.create(
      :restaurant,
      :with_avatar,
      name: 'My Restaurant',
      monday_hours: '10-20',
      tuesday_hours: '10-20',
      wednesday_hours: '11-20',
      thursday_hours: '10-20',
      friday_hours: '10-24',
      saturday_hours: '10-24',
      sunday_hours: '10-24',
      website: 'http://meme.menu.com',
      photographer_name: 'John Doe',
      photographer_media_link: 'http://john.doe.com',
      facebook: 'http://facebook.com/MyRestaurant',
      twitter: 'http://twitter.com/MyRestaurant',
      instagram: 'http://instagram.com/MyRestaurant',
      maps_url: 'http://maps.google.com/MyRestaurant',
      status: 'iOS Status Message',
      delivery_url: 'http://delivery.com/MyRestaurant',
      restaurant_banner: banner,
      restaurant_header: header,
      restaurant_tile: tile
    )
  end

  before do
    render partial: 'ios/base_restaurant', locals: { restaurant: restaurant }
  end

  it 'renders the basic info of the restaurant' do
    parsed = JSON.parse(rendered)
    expect(parsed.keys.length).to eq(24)
    expect(parsed['name']).to eq('My Restaurant')
    expect(parsed['avatar']).to eq(restaurant.avatar.url)
    expect(parsed['restaurant_header']).to eq(header.avatar.url)
    expect(parsed['ios_tile']).to eq(tile.avatar.url)
    expect(parsed['address_1']).to eq('123 Test St.')
    expect(parsed['address_2']).to eq('Suite 2')
    expect(parsed['city']).to eq('Miami')
    expect(parsed['state']).to eq('FL')
    expect(parsed['zipcode']).to eq('12345')
    expect(parsed['phone']).to eq('0123456789')
    expect(parsed['zone']).to eq('Miami Beach')
    expect(parsed['monday_hours']).to eq('10-20')
    expect(parsed['tuesday_hours']).to eq('10-20')
    expect(parsed['wednesday_hours']).to eq('11-20')
    expect(parsed['thursday_hours']).to eq('10-20')
    expect(parsed['friday_hours']).to eq('10-24')
    expect(parsed['saturday_hours']).to eq('10-24')
    expect(parsed['sunday_hours']).to eq('10-24')
    expect(parsed['website']).to eq('http://meme.menu.com')
    expect(parsed['photographer_name']).to eq('John Doe')
    expect(parsed['photographer_media_link']).to eq('http://john.doe.com')
    expect(parsed['facebook']).to eq('http://facebook.com/MyRestaurant')
    expect(parsed['twitter']).to eq('http://twitter.com/MyRestaurant')
    expect(parsed['instagram']).to eq('http://instagram.com/MyRestaurant')
  end
end
