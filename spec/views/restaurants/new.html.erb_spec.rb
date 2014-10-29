require 'rails_helper'

RSpec.describe "restaurants/new", :type => :view do
  before(:each) do
    assign(:restaurant, Restaurant.new(
      :name => "MyString",
      :address_1 => "MyString",
      :address_2 => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zipcode => "MyString",
      :description => "MyText",
      :phone => "MyString",
      :dollars => 1,
      :reservations => false
    ))
  end

  it "renders new restaurant form" do
    render

    assert_select "form[action=?][method=?]", restaurants_path, "post" do

      assert_select "input#restaurant_name[name=?]", "restaurant[name]"

      assert_select "input#restaurant_address_1[name=?]", "restaurant[address_1]"

      assert_select "input#restaurant_address_2[name=?]", "restaurant[address_2]"

      assert_select "input#restaurant_city[name=?]", "restaurant[city]"

      assert_select "input#restaurant_state[name=?]", "restaurant[state]"

      assert_select "input#restaurant_zipcode[name=?]", "restaurant[zipcode]"

      assert_select "textarea#restaurant_description[name=?]", "restaurant[description]"

      assert_select "input#restaurant_phone[name=?]", "restaurant[phone]"

      assert_select "input#restaurant_dollars[name=?]", "restaurant[dollars]"

      assert_select "input#restaurant_reservations[name=?]", "restaurant[reservations]"
    end
  end
end
