require 'rails_helper'

RSpec.describe "restaurant_tiles/show", :type => :view do
  before(:each) do
    @restaurant_tile = assign(:restaurant_tile, RestaurantTile.create!(
      :restaurant => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
