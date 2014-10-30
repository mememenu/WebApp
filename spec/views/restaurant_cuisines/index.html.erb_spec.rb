require 'rails_helper'

RSpec.describe "restaurant_cuisines/index", :type => :view do
  before(:each) do
    assign(:restaurant_cuisines, [
      RestaurantCuisine.create!(
        :references => "",
        :references => ""
      ),
      RestaurantCuisine.create!(
        :references => "",
        :references => ""
      )
    ])
  end

  it "renders a list of restaurant_cuisines" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
