require 'rails_helper'

RSpec.describe 'menus/index', :type => :view do
  let(:menu1) { FactoryGirl.create(:menu, name: 'My Menu', description: 'My Description') }
  let(:menu2) { FactoryGirl.create(:menu, name: 'My Menu2', description: 'My Description2') }

  before(:each) do
    assign(:menus, [menu1, menu2])
    render
  end

  it 'renders a title' do
    expect(rendered).to have_css('h1', text: 'Listing menus')
  end

  it 'renders the table header' do
    expect(rendered).to have_css('thead th', text: 'Name')
    expect(rendered).to have_css('thead th', text: 'Hidden')
    expect(rendered).to have_css('thead th', text: 'Description')
    expect(rendered).to have_css('thead th', text: 'Restaurant')
  end

  it 'renders a list of menus' do
    expect(rendered).to have_css('tbody td', text: 'My Menu')
    expect(rendered).to have_css('tbody td', text: /^$/, count: 2)
    expect(rendered).to have_css('tbody td', text: 'My Description')
    expect(rendered).to have_css('tbody td', text: menu1.place.name)
    expect(rendered).to have_link('Show', href: menu_path(menu1))
    expect(rendered).to have_link('Edit', href: edit_menu_path(menu1))
    expect(rendered).to have_link('Destroy', href: menu_path(menu1))

    expect(rendered).to have_css('tbody td', text: 'My Menu2')
    expect(rendered).to have_css('tbody td', text: 'My Description2')
    expect(rendered).to have_css('tbody td', text: menu2.place.name)
    expect(rendered).to have_link('Show', href: menu_path(menu2))
    expect(rendered).to have_link('Edit', href: edit_menu_path(menu2))
    expect(rendered).to have_link('Destroy', href: menu_path(menu2))
  end
end
