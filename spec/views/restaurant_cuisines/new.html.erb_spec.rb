require 'rails_helper'

RSpec.describe "restaurant_cuisines/new", :type => :view do
  before(:each) do
    assign(:restaurant_cuisine, RestaurantCuisine.new(
      :restaurant => nil,
      :cuisine => nil
    ))
  end

  it "renders new restaurant_cuisine form" do
    render

    assert_select "form[action=?][method=?]", restaurant_cuisines_path, "post" do

      assert_select "input#restaurant_cuisine_restaurant_id[name=?]", "restaurant_cuisine[restaurant_id]"

      assert_select "input#restaurant_cuisine_cuisine_id[name=?]", "restaurant_cuisine[cuisine_id]"
    end
  end
end
