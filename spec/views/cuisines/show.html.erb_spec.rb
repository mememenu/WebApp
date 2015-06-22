require 'rails_helper'

RSpec.describe 'cuisines/show', :type => :view do
  let(:cuisine) { FactoryGirl.create(:cuisine_with_restaurants) }
  let(:restaurant1) { cuisine.restaurants.first }
  let(:restaurant2) { cuisine.restaurants.last }

  before(:each) do
    assign(:cuisine, cuisine)
    render
  end

  it 'renders the genre' do
    expect(rendered).to have_css('p', text: 'Genre:')
    expect(rendered).to have_css('p', text: 'French')
  end

  it 'renders the restaurants' do
    expect(rendered).to have_css('.row .container', count: 2)
    expect(rendered).to have_css('.row .container a', count: 2)
    expect(rendered).to include(restaurant_path(restaurant1))
    expect(rendered).to include(restaurant_path(restaurant2))
    expect(rendered).to have_css("img[src*='#{restaurant1.avatar.url(:medium)}']")
    expect(rendered).to have_css("img[src*='#{restaurant2.avatar.url(:medium)}']")
  end
end
