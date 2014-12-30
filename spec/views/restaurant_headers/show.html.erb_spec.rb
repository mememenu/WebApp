require 'rails_helper'

RSpec.describe "restaurant_headers/show", :type => :view do
  before(:each) do
    @restaurant_header = assign(:restaurant_header, RestaurantHeader.create!(
      :restaurant => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
