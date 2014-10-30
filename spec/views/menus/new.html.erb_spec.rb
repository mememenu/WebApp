require 'rails_helper'

RSpec.describe "menus/new", :type => :view do
  before(:each) do
    assign(:menu, Menu.new(
      :name => "MyString",
      :display_name => "MyString",
      :description => "MyText",
      :restaurant => nil
    ))
  end

  it "renders new menu form" do
    render

    assert_select "form[action=?][method=?]", menus_path, "post" do

      assert_select "input#menu_name[name=?]", "menu[name]"

      assert_select "input#menu_display_name[name=?]", "menu[display_name]"

      assert_select "textarea#menu_description[name=?]", "menu[description]"

      assert_select "input#menu_restaurant_id[name=?]", "menu[restaurant_id]"
    end
  end
end
