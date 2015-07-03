require 'rails_helper'

RSpec.describe 'ios/restaurant_info.json.jbuilder', type: :view do
  before do
    assign(:restaurants, FactoryGirl.create_list(:restaurant, 2))
    render
  end

  it 'renders a list of restaurants' do
    parsed = JSON.parse(rendered)

    expect(view).to render_template(partial: 'ios/_base_restaurant', count: 2)
    expect(parsed).to be_an_instance_of(Array)
    expect(parsed.length).to eq(2)
  end
end
