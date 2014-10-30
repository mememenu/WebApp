require 'rails_helper'

RSpec.describe "restaurant_cuisines/index", :type => :view do
  before(:each) do
    assign(:restaurant_cuisines, [
      RestaurantCuisine.create!(
        :restaurant => nil,
        :cuisine => nil
      ),
      RestaurantCuisine.create!(
        :restaurant => nil,
        :cuisine => nil
      )
    ])
  end

  it "renders a list of restaurant_cuisines" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
