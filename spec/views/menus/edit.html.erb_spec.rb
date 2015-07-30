require 'rails_helper'

RSpec.describe 'menus/edit', :type => :view do
  let(:menu) { FactoryGirl.create(:menu, name: 'My Menu') }

  before(:each) do
    assign(:menu, menu)
    render
  end

  it 'renders the edit menu form' do
    expect(rendered).to render_template('menus/_form')
  end

  it 'renders a link to go back' do
    expect(rendered).to have_link('Back', href: place_path(menu.place))
  end
end
