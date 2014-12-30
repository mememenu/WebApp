require 'rails_helper'

RSpec.describe "restaurant_headers/new", :type => :view do
  before(:each) do
    assign(:restaurant_header, RestaurantHeader.new(
      :restaurant => nil
    ))
  end

  it "renders new restaurant_header form" do
    render

    assert_select "form[action=?][method=?]", restaurant_headers_path, "post" do

      assert_select "input#restaurant_header_restaurant_id[name=?]", "restaurant_header[restaurant_id]"
    end
  end
end
