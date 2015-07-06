require 'rails_helper'

RSpec.describe 'ios/nola_restaurants_list.json.jbuilder', type: :view do
  let(:restaurants) { FactoryGirl.create_list(:restaurant, 2) }
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

    expect(first.keys.length).to eq(18)
    expect(first['slug']).to eq(restaurant1.slug)

    expect(second.keys.length).to eq(18)
    expect(second['slug']).to eq(restaurant2.slug)
  end
end
