require 'rails_helper'

RSpec.describe "menus/edit", :type => :view do
  before(:each) do
    @menu = assign(:menu, Menu.create!(
      :name => "MyString",
      :display_name => "MyString",
      :description => "MyText",
      :restaurant => nil
    ))
  end

  it "renders the edit menu form" do
    render

    assert_select "form[action=?][method=?]", menu_path(@menu), "post" do

      assert_select "input#menu_name[name=?]", "menu[name]"

      assert_select "input#menu_display_name[name=?]", "menu[display_name]"

      assert_select "textarea#menu_description[name=?]", "menu[description]"

      assert_select "input#menu_restaurant_id[name=?]", "menu[restaurant_id]"
    end
  end
end
