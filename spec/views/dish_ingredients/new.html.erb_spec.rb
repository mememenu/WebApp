require 'rails_helper'

RSpec.describe "dish_ingredients/new", :type => :view do
  before(:each) do
    assign(:dish_ingredient, DishIngredient.new(
      :dish => nil,
      :ingredient => nil
    ))
  end

  it "renders new dish_ingredient form" do
    render

    assert_select "form[action=?][method=?]", dish_ingredients_path, "post" do

      assert_select "input#dish_ingredient_dish_id[name=?]", "dish_ingredient[dish_id]"

      assert_select "input#dish_ingredient_ingredient_id[name=?]", "dish_ingredient[ingredient_id]"
    end
  end
end
