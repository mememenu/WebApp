require 'rails_helper'

RSpec.describe 'ios/miami_places_list.json.jbuilder', type: :view do
  let(:banner) { FactoryGirl.create(:banner, :with_avatar) }
  let(:header) { FactoryGirl.create(:header, :with_avatar) }
  let(:tile) { FactoryGirl.create(:tile, :with_avatar) }
  let(:places) do
    FactoryGirl.create_list(
      :place,
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
      banner: banner,
      header: header,
      tile: tile
    )
  end

  before do
    assign(:places, places)
    render
  end

  it 'renders a list of places' do
    place1, place2 = *places
    parsed = JSON.parse(rendered)
    first, second = *parsed

    expect(view).to render_template(partial: 'ios/_base_place', count: 2)
    expect(parsed).to be_an_instance_of(Array)
    expect(parsed.length).to eq(2)

    expect(first.keys.length).to eq(26)
    expect(first['slug']).to eq(place1.slug)
    expect(first['lat']).to eq(25.7982813)
    expect(first['long']).to eq(-80.1283682)
    expect(first['cloud_front']).to eq(tile.cloudfront_url)
    expect(first['maps_url']).to eq('http://maps.google.com/MyRestaurant')
    expect(first['delivery_url']).to eq('http://delivery.com/MyRestaurant')
    expect(first['foursquare_id']).to eq('123456')
    expect(first['status']).to eq('iOS Status Message')
    expect(first['restaurant_banner']).to eq(banner.avatar.url)

    expect(second.keys.length).to eq(26)
    expect(second['slug']).to eq(place2.slug)
    expect(second['lat']).to eq(25.7982813)
    expect(second['long']).to eq(-80.1283682)
    expect(second['cloud_front']).to eq(tile.cloudfront_url)
    expect(second['maps_url']).to eq('http://maps.google.com/MyRestaurant')
    expect(second['delivery_url']).to eq('http://delivery.com/MyRestaurant')
    expect(second['foursquare_id']).to eq('123456')
    expect(second['status']).to eq('iOS Status Message')
    expect(second['restaurant_banner']).to eq(banner.avatar.url)
  end
end
