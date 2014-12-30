require 'rails_helper'

RSpec.describe "restaurant_headers/edit", :type => :view do
  before(:each) do
    @restaurant_header = assign(:restaurant_header, RestaurantHeader.create!(
      :restaurant => nil
    ))
  end

  it "renders the edit restaurant_header form" do
    render

    assert_select "form[action=?][method=?]", restaurant_header_path(@restaurant_header), "post" do

      assert_select "input#restaurant_header_restaurant_id[name=?]", "restaurant_header[restaurant_id]"
    end
  end
end
