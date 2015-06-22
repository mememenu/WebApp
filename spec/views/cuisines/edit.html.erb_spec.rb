require 'rails_helper'

RSpec.describe 'cuisines/edit', :type => :view do
  let(:cuisine) { Cuisine.create!(genre: 'French') }

  before(:each) do
    assign(:cuisine, cuisine)
    render
  end

  it 'has a title' do
    expect(rendered).to have_css('h1', text: 'Editing cuisine')

  end

  it 'renders the edit cuisine form' do
    expect(rendered).to render_template('cuisines/_form')
  end

  it 'has links' do
    expect(rendered).to have_link('Show', href: cuisine_path(cuisine))
    expect(rendered).to have_link('Back', href: cuisines_path)
  end
end
