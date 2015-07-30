require 'rails_helper'

RSpec.describe 'ios/_base_place.json.jbuilder', type: :view do
  let(:banner) { FactoryGirl.create(:banner, :with_avatar) }
  let(:header) { FactoryGirl.create(:header, :with_avatar) }
  let(:tile) { FactoryGirl.create(:tile, :with_avatar) }
  let(:place) do
    FactoryGirl.create(
      :place,
      :with_avatar,
      name: 'My place',
      website: 'http://meme.menu.com',
      photographer_name: 'John Doe',
      photographer_media_link: 'http://john.doe.com',
      facebook: 'http://facebook.com/MyRestaurant',
      twitter: 'http://twitter.com/MyRestaurant',
      instagram: 'http://instagram.com/MyRestaurant',
      maps_url: 'http://maps.google.com/MyRestaurant',
      status: 'iOS Status Message',
      delivery_url: 'http://delivery.com/MyRestaurant',
      banner: banner,
      header: header,
      tile: tile
    )
  end

  before do
    render partial: 'ios/base_place', locals: { place: place }
  end

  it 'renders the basic info of the place' do
    parsed = JSON.parse(rendered)
    expect(parsed.keys.length).to eq(17)
    expect(parsed['name']).to eq('My place')
    expect(parsed['avatar']).to eq(place.avatar.url)
    expect(parsed['restaurant_header']).to eq(header.avatar.url)
    expect(parsed['ios_tile']).to eq(tile.avatar.url)
    expect(parsed['address_1']).to eq('123 Test St.')
    expect(parsed['address_2']).to eq('Suite 2')
    expect(parsed['city']).to eq('Miami')
    expect(parsed['state']).to eq('FL')
    expect(parsed['zipcode']).to eq('12345')
    expect(parsed['phone']).to eq('0123456789')
    expect(parsed['zone']).to eq('Miami Beach')
    expect(parsed['website']).to eq('http://meme.menu.com')
    expect(parsed['photographer_name']).to eq('John Doe')
    expect(parsed['photographer_media_link']).to eq('http://john.doe.com')
    expect(parsed['facebook']).to eq('http://facebook.com/MyRestaurant')
    expect(parsed['twitter']).to eq('http://twitter.com/MyRestaurant')
    expect(parsed['instagram']).to eq('http://instagram.com/MyRestaurant')
  end
end
