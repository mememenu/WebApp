require 'rails_helper'

RSpec.describe 'dishes/edit', :type => :view do
  let(:dish) { FactoryGirl.create(:dish) }

  before(:each) do
    assign(:dish, dish)
    assign(:menus, dish.restaurant.menus)
    assign(:restaurant, dish.restaurant)
    render
  end

  it 'renders the edit dish form' do
    expect(rendered).to render_template('dishes/_form')
  end

  it 'renders a link to go back' do
    expect(rendered).to have_link('Back', href: restaurant_path(dish.restaurant))
  end
end
