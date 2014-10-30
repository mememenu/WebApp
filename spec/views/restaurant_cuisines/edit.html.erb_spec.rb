require 'rails_helper'

RSpec.describe "restaurant_cuisines/edit", :type => :view do
  before(:each) do
    @restaurant_cuisine = assign(:restaurant_cuisine, RestaurantCuisine.create!(
      :restaurant => nil,
      :cuisine => nil
    ))
  end

  it "renders the edit restaurant_cuisine form" do
    render

    assert_select "form[action=?][method=?]", restaurant_cuisine_path(@restaurant_cuisine), "post" do

      assert_select "input#restaurant_cuisine_restaurant_id[name=?]", "restaurant_cuisine[restaurant_id]"

      assert_select "input#restaurant_cuisine_cuisine_id[name=?]", "restaurant_cuisine[cuisine_id]"
    end
  end
end
