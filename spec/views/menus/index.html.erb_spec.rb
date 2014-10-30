require 'rails_helper'

RSpec.describe "menus/index", :type => :view do
  before(:each) do
    assign(:menus, [
      Menu.create!(
        :name => "Name",
        :display_name => "Display Name",
        :description => "MyText",
        :restaurant => nil
      ),
      Menu.create!(
        :name => "Name",
        :display_name => "Display Name",
        :description => "MyText",
        :restaurant => nil
      )
    ])
  end

  it "renders a list of menus" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Display Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
