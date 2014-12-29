require 'rails_helper'

RSpec.describe "restaurant_tiles/new", :type => :view do
  before(:each) do
    assign(:restaurant_tile, RestaurantTile.new(
      :restaurant => nil
    ))
  end

  it "renders new restaurant_tile form" do
    render

    assert_select "form[action=?][method=?]", restaurant_tiles_path, "post" do

      assert_select "input#restaurant_tile_restaurant_id[name=?]", "restaurant_tile[restaurant_id]"
    end
  end
end
