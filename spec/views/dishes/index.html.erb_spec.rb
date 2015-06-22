require 'rails_helper'

RSpec.describe 'dishes/index', :type => :view do
  let(:restaurant) { FactoryGirl.create(:restaurant, name: 'Parrillada') }
  let(:dish1) { FactoryGirl.create(:dish, name: 'Asado', restaurant: restaurant) }
  let(:dish2) { FactoryGirl.create(:dish, name: 'Chivito', restaurant: restaurant) }
  let(:dishes) { [dish1, dish2] }

  before(:each) do
    assign(:dishes, dishes)
    render
  end

  it 'renders a title' do
    expect(rendered).to have_css('h1', text: 'Listing dishes')
  end

  it 'renders a table header' do
    expect(rendered).to have_css('thead th', text: 'Name')
    expect(rendered).to have_css('thead th', text: 'Category')
    expect(rendered).to have_css('thead th', text: 'Menu')
    expect(rendered).to have_css('thead th', text: 'Restaurant')
    expect(rendered).to have_css('thead th', text: 'Hidden')
  end

  it 'renders a table with dishes' do
    expect(rendered).to have_css('tbody td', text: 'Asado')
    expect(rendered).to have_css('tbody td', text: dish1.category.name)
    expect(rendered).to have_css('tbody td', text: dish1.menu.name)
    expect(rendered).to have_css('tbody td', text: 'Parrillada', count: 2)
    expect(rendered).to have_link('Show', href: dish_path(dish1))
    expect(rendered).to have_link('Edit', href: edit_dish_path(dish1))
    expect(rendered).to have_link('Destroy', href: dish_path(dish1))
    expect(rendered).to have_css('tbody td', text: 'Asado')
    expect(rendered).to have_css('tbody td', text: dish2.category.name)
    expect(rendered).to have_css('tbody td', text: dish2.menu.name)
    expect(rendered).to have_link('Show', href: dish_path(dish2))
    expect(rendered).to have_link('Edit', href: edit_dish_path(dish2))
    expect(rendered).to have_link('Destroy', href: dish_path(dish2))
  end
end
