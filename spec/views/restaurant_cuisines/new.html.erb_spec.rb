require 'rails_helper'

RSpec.describe "restaurant_cuisines/new", :type => :view do
  before(:each) do
    assign(:restaurant_cuisine, RestaurantCuisine.new(
      :references => "",
      :references => ""
    ))
  end

  it "renders new restaurant_cuisine form" do
    render

    assert_select "form[action=?][method=?]", restaurant_cuisines_path, "post" do

      assert_select "input#restaurant_cuisine_references[name=?]", "restaurant_cuisine[references]"

      assert_select "input#restaurant_cuisine_references[name=?]", "restaurant_cuisine[references]"
    end
  end
end
