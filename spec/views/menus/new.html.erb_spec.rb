require 'rails_helper'

RSpec.describe 'menus/new', :type => :view do
  before(:each) do
    assign(:menu, Menu.new)
    render
  end

  it "renders new menu form" do
    expect(rendered).to render_template('menus/_form')
  end

  it 'renders a link to go back' do
    expect(rendered).to have_link('Back', href: menus_path)
  end
end
