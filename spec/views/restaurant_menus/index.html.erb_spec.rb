require 'rails_helper'

RSpec.describe "restaurant_menus/index", :type => :view do
  before(:each) do
    assign(:restaurant_menus, [
      RestaurantMenu.create!(
        :restaurant => nil,
        :menu => nil
      ),
      RestaurantMenu.create!(
        :restaurant => nil,
        :menu => nil
      )
    ])
  end

  it "renders a list of restaurant_menus" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
