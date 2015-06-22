require 'rails_helper'

RSpec.describe 'cuisines/index', :type => :view do
  let(:cuisines) { FactoryGirl.create_list(:cuisine, 2) }

  before(:each) do
    assign(:cuisines, cuisines)
    render
  end

  it 'it has a title' do
    expect(rendered).to have_css('h1', text: 'Listing cuisines')
  end

  it 'has a table header' do
    expect(rendered).to have_css('thead th', text: 'Genre')
  end

  it 'has a table with the cuisines' do
    expect(rendered).to have_css('tbody td', text: 'French', count: 2)
    expect(rendered).to have_link('Show', href: cuisine_path(cuisines.first))
    expect(rendered).to have_link('Show', href: cuisine_path(cuisines.last))
    expect(rendered).to have_link('Edit', href: edit_cuisine_path(cuisines.first))
    expect(rendered).to have_link('Edit', href: edit_cuisine_path(cuisines.last))
    expect(rendered).to have_link('Destroy', href: cuisine_path(cuisines.first))
    expect(rendered).to have_link('Destroy', href: cuisine_path(cuisines.last))
  end
end
