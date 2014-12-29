require 'rails_helper'

RSpec.describe "restaurant_tiles/edit", :type => :view do
  before(:each) do
    @restaurant_tile = assign(:restaurant_tile, RestaurantTile.create!(
      :restaurant => nil
    ))
  end

  it "renders the edit restaurant_tile form" do
    render

    assert_select "form[action=?][method=?]", restaurant_tile_path(@restaurant_tile), "post" do

      assert_select "input#restaurant_tile_restaurant_id[name=?]", "restaurant_tile[restaurant_id]"
    end
  end
end
