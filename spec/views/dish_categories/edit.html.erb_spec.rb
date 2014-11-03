require 'rails_helper'

RSpec.describe "dish_categories/edit", :type => :view do
  before(:each) do
    @dish_category = assign(:dish_category, DishCategory.create!(
      :category => nil,
      :dish => nil
    ))
  end

  it "renders the edit dish_category form" do
    render

    assert_select "form[action=?][method=?]", dish_category_path(@dish_category), "post" do

      assert_select "input#dish_category_category_id[name=?]", "dish_category[category_id]"

      assert_select "input#dish_category_dish_id[name=?]", "dish_category[dish_id]"
    end
  end
end
