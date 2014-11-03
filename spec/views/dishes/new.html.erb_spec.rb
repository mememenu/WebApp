require 'rails_helper'

RSpec.describe "dishes/new", :type => :view do
  before(:each) do
    assign(:dish, Dish.new(
      :name => "MyString",
      :description => "MyText",
      :category => "MyString",
      :category_display => "MyString",
      :portion_size => "MyString",
      :spice => 1,
      :hot => false,
      :gluten_free => false,
      :vegetarian => false,
      :menu => nil
    ))
  end

  it "renders new dish form" do
    render

    assert_select "form[action=?][method=?]", dishes_path, "post" do

      assert_select "input#dish_name[name=?]", "dish[name]"

      assert_select "textarea#dish_description[name=?]", "dish[description]"

      assert_select "input#dish_category[name=?]", "dish[category]"

      assert_select "input#dish_category_display[name=?]", "dish[category_display]"

      assert_select "input#dish_portion_size[name=?]", "dish[portion_size]"

      assert_select "input#dish_spice[name=?]", "dish[spice]"

      assert_select "input#dish_hot[name=?]", "dish[hot]"

      assert_select "input#dish_gluten_free[name=?]", "dish[gluten_free]"

      assert_select "input#dish_vegetarian[name=?]", "dish[vegetarian]"

      assert_select "input#dish_menu_id[name=?]", "dish[menu_id]"
    end
  end
end
