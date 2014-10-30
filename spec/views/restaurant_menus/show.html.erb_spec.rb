require 'rails_helper'

RSpec.describe "restaurant_menus/show", :type => :view do
  before(:each) do
    @restaurant_menu = assign(:restaurant_menu, RestaurantMenu.create!(
      :restaurant => nil,
      :menu => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
