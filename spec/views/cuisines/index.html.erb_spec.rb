require 'rails_helper'

RSpec.describe "cuisines/index", :type => :view do
  before(:each) do
    assign(:cuisines, [
      Cuisine.create!(
        :type => "Type"
      ),
      Cuisine.create!(
        :type => "Type"
      )
    ])
  end

  it "renders a list of cuisines" do
    render
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end
