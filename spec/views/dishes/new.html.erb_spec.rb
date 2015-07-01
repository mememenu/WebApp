require 'rails_helper'

RSpec.describe 'dishes/new', :type => :view do
  let(:restaurant) { FactoryGirl.create(:restaurant) }

  before(:each) do
    assign(:dish, Dish.new)
    assign(:restaurant, restaurant)
    assign(:menus, restaurant.menus)
    render
  end

  it 'renders a title' do
    expect(rendered).to have_css('h1', text: 'New Dish')
  end

  it 'renders new dish form' do
    expect(rendered).to render_template('dishes/_form')
  end

  it 'renders a link to go back' do
    expect(rendered).to have_link('Back', dishes_path)
  end
end
