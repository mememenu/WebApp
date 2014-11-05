require 'rails_helper'

RSpec.describe "dish_ingredients/index", :type => :view do
  before(:each) do
    assign(:dish_ingredients, [
      DishIngredient.create!(
        :dish => nil,
        :ingredient => nil
      ),
      DishIngredient.create!(
        :dish => nil,
        :ingredient => nil
      )
    ])
  end

  it "renders a list of dish_ingredients" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
