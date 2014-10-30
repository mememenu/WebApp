require 'rails_helper'

RSpec.describe "restaurant_menus/new", :type => :view do
  before(:each) do
    assign(:restaurant_menu, RestaurantMenu.new(
      :restaurant => nil,
      :menu => nil
    ))
  end

  it "renders new restaurant_menu form" do
    render

    assert_select "form[action=?][method=?]", restaurant_menus_path, "post" do

      assert_select "input#restaurant_menu_restaurant_id[name=?]", "restaurant_menu[restaurant_id]"

      assert_select "input#restaurant_menu_menu_id[name=?]", "restaurant_menu[menu_id]"
    end
  end
end
