require 'rails_helper'

RSpec.describe 'ios/miami_restaurants_list.json.jbuilder', type: :view do
  let(:banner) { FactoryGirl.create(:restaurant_banner, :with_avatar) }
  let(:header) { FactoryGirl.create(:restaurant_header, :with_avatar) }
  let(:tile) { FactoryGirl.create(:restaurant_tile, :with_avatar) }
  let(:restaurants) do
    FactoryGirl.create_list(
      :restaurant,
      2,
      :with_avatar,
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
    assign(:restaurants, restaurants)
    render
  end

  it 'renders a list of restaurants' do
    restaurant1, restaurant2 = *restaurants
    parsed = JSON.parse(rendered)
    first, second = *parsed

    expect(view).to render_template(partial: 'ios/_base_restaurant', count: 2)
    expect(parsed).to be_an_instance_of(Array)
    expect(parsed.length).to eq(2)

    expect(first.keys.length).to eq(26)
    expect(first['slug']).to eq(restaurant1.slug)
    expect(first['lat']).to eq(25.7982813)
    expect(first['long']).to eq(-80.1283682)
    expect(first['cloud_front']).to eq(tile.cloud_front)
    expect(first['maps_url']).to eq('http://maps.google.com/MyRestaurant')
    expect(first['delivery_url']).to eq('http://delivery.com/MyRestaurant')
    expect(first['foursquare_id']).to eq('123456')
    expect(first['status']).to eq('iOS Status Message')
    expect(first['restaurant_banner']).to eq(banner.avatar.url)

    expect(second.keys.length).to eq(26)
    expect(second['slug']).to eq(restaurant2.slug)
    expect(second['lat']).to eq(25.7982813)
    expect(second['long']).to eq(-80.1283682)
    expect(second['cloud_front']).to eq(tile.cloud_front)
    expect(second['maps_url']).to eq('http://maps.google.com/MyRestaurant')
    expect(second['delivery_url']).to eq('http://delivery.com/MyRestaurant')
    expect(second['foursquare_id']).to eq('123456')
    expect(second['status']).to eq('iOS Status Message')
    expect(second['restaurant_banner']).to eq(banner.avatar.url)
  end
end
