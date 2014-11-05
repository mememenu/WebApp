require 'rails_helper'

RSpec.describe "dish_ingredients/edit", :type => :view do
  before(:each) do
    @dish_ingredient = assign(:dish_ingredient, DishIngredient.create!(
      :dish => nil,
      :ingredient => nil
    ))
  end

  it "renders the edit dish_ingredient form" do
    render

    assert_select "form[action=?][method=?]", dish_ingredient_path(@dish_ingredient), "post" do

      assert_select "input#dish_ingredient_dish_id[name=?]", "dish_ingredient[dish_id]"

      assert_select "input#dish_ingredient_ingredient_id[name=?]", "dish_ingredient[ingredient_id]"
    end
  end
end
