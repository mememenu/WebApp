require 'rails_helper'

RSpec.describe 'menus/show', :type => :view do
  let(:restaurant) { FactoryGirl.create(:restaurant, :with_avatar) }
  let(:category) { FactoryGirl.create(:category_with_dishes, name: 'Category 1') }
  let(:menu) { FactoryGirl.create(:menu, name: 'My Menu', restaurant: restaurant) }

  before(:each) do
    assign(:menu, menu)
    assign(:categories, [category])
    assign(:dishes, category.dishes)
    assign(:category, Category.new(menu: menu))
    render
  end

  it 'renders a link to the restaurant and the menu\'s name' do
    expect(rendered).to have_css('.text-center h3', text: 'My Menu')
    expect(rendered).to have_css("img[src*='#{restaurant.avatar.url(:medium)}']")
  end

  it 'renders the categories' do
    expect(rendered).to have_link('Category 1', href: category_path(category))
    expect(rendered).to have_link('All', href: menu_path(menu))
  end

  it 'renders the dishes' do
    dish = category.dishes.first
    expect(rendered).to have_css("img[src*='#{dish.avatar.url(:medium)}']")
    expect(rendered).to have_link(dish.name, href: dish_path(dish))
  end
end
