require 'rails_helper'

RSpec.describe "dish_categories/index", :type => :view do
  before(:each) do
    assign(:dish_categories, [
      DishCategory.create!(
        :category => nil,
        :dish => nil
      ),
      DishCategory.create!(
        :category => nil,
        :dish => nil
      )
    ])
  end

  it "renders a list of dish_categories" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
