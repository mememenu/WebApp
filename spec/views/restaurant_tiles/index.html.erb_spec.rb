require 'rails_helper'

RSpec.describe "restaurant_tiles/index", :type => :view do
  before(:each) do
    assign(:restaurant_tiles, [
      RestaurantTile.create!(
        :restaurant => nil
      ),
      RestaurantTile.create!(
        :restaurant => nil
      )
    ])
  end

  it "renders a list of restaurant_tiles" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
