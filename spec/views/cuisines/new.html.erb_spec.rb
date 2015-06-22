require 'rails_helper'

RSpec.describe 'cuisines/new', :type => :view do
  before(:each) do
    assign(:cuisine, FactoryGirl.create(:cuisine))
    render
  end

  it 'has a title' do
    expect(rendered).to have_css('h1', text: 'New cuisine')
  end

  it 'renders the form' do
    expect(rendered).to render_template('cuisines/_form')
  end

  it 'has a link to go back' do
    expect(rendered).to have_link('Back', href: cuisines_path)
  end
end
