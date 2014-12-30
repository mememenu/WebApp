require 'rails_helper'

RSpec.describe "restaurant_headers/index", :type => :view do
  before(:each) do
    assign(:restaurant_headers, [
      RestaurantHeader.create!(
        :restaurant => nil
      ),
      RestaurantHeader.create!(
        :restaurant => nil
      )
    ])
  end

  it "renders a list of restaurant_headers" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
