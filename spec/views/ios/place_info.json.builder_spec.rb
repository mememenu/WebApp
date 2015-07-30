require 'rails_helper'

RSpec.describe 'ios/place_info.json.jbuilder', type: :view do
  before do
    assign(:places, FactoryGirl.create_list(:place, 2))
    render
  end

  it 'renders a list of places' do
    parsed = JSON.parse(rendered)

    expect(view).to render_template(partial: 'ios/_base_place', count: 2)
    expect(parsed).to be_an_instance_of(Array)
    expect(parsed.length).to eq(2)
  end
end
