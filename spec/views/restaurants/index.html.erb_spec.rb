require 'rails_helper'

RSpec.describe "restaurants/index", :type => :view do
  before(:each) do
    assign(:restaurants, [
      Restaurant.create!(
        :name => "Name",
        :address_1 => "Address 1",
        :address_2 => "Address 2",
        :city => "City",
        :state => "State",
        :zipcode => "Zipcode",
        :description => "MyText",
        :phone => "Phone",
        :dollars => 1,
        :reservations => false
      ),
      Restaurant.create!(
        :name => "Name",
        :address_1 => "Address 1",
        :address_2 => "Address 2",
        :city => "City",
        :state => "State",
        :zipcode => "Zipcode",
        :description => "MyText",
        :phone => "Phone",
        :dollars => 1,
        :reservations => false
      )
    ])
  end

  it "renders a list of restaurants" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address 1".to_s, :count => 2
    assert_select "tr>td", :text => "Address 2".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Zipcode".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
