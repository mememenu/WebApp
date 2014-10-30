require 'rails_helper'

RSpec.describe "restaurant_menus/edit", :type => :view do
  before(:each) do
    @restaurant_menu = assign(:restaurant_menu, RestaurantMenu.create!(
      :restaurant => nil,
      :menu => nil
    ))
  end

  it "renders the edit restaurant_menu form" do
    render

    assert_select "form[action=?][method=?]", restaurant_menu_path(@restaurant_menu), "post" do

      assert_select "input#restaurant_menu_restaurant_id[name=?]", "restaurant_menu[restaurant_id]"

      assert_select "input#restaurant_menu_menu_id[name=?]", "restaurant_menu[menu_id]"
    end
  end
end
