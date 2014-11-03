require 'rails_helper'

RSpec.describe "dishes/index", :type => :view do
  before(:each) do
    assign(:dishes, [
      Dish.create!(
        :name => "Name",
        :description => "MyText",
        :category => "Category",
        :category_display => "Category Display",
        :portion_size => "Portion Size",
        :spice => 1,
        :hot => false,
        :gluten_free => false,
        :vegetarian => false,
        :menu => nil
      ),
      Dish.create!(
        :name => "Name",
        :description => "MyText",
        :category => "Category",
        :category_display => "Category Display",
        :portion_size => "Portion Size",
        :spice => 1,
        :hot => false,
        :gluten_free => false,
        :vegetarian => false,
        :menu => nil
      )
    ])
  end

  it "renders a list of dishes" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "Category Display".to_s, :count => 2
    assert_select "tr>td", :text => "Portion Size".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
