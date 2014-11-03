require 'rails_helper'

RSpec.describe "dish_categories/new", :type => :view do
  before(:each) do
    assign(:dish_category, DishCategory.new(
      :category => nil,
      :dish => nil
    ))
  end

  it "renders new dish_category form" do
    render

    assert_select "form[action=?][method=?]", dish_categories_path, "post" do

      assert_select "input#dish_category_category_id[name=?]", "dish_category[category_id]"

      assert_select "input#dish_category_dish_id[name=?]", "dish_category[dish_id]"
    end
  end
end
