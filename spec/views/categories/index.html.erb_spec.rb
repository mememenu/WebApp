require 'rails_helper'

RSpec.describe "categories/index", :type => :view do
  let(:categories) { FactoryGirl.create_list(:category, 2) }

  before(:each) do
    assign(:categories, categories)
    render
  end

  it 'has a title' do
    expect(rendered).to have_css('h1', text: 'Listing categories')
  end

  it 'has a table header' do
    expect(rendered).to have_css('thead th', text: 'Name')
    expect(rendered).to have_css('thead th', text: 'Hidden')
  end

  it 'has a table with the categories' do
    expect(rendered).to have_css('tbody td', text: 'Test category', count: 2)
    expect(rendered).to have_link('Show', href: category_path(categories.first))
    expect(rendered).to have_link('Show', href: category_path(categories.last))
    expect(rendered).to have_link('Edit', href: edit_category_path(categories.first))
    expect(rendered).to have_link('Edit', href: edit_category_path(categories.last))
    expect(rendered).to have_link('Destroy', href: category_path(categories.first))
    expect(rendered).to have_link('Destroy', href: category_path(categories.last))
  end
end
