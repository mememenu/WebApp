require 'rails_helper'

RSpec.describe "cuisines/edit", :type => :view do
  before(:each) do
    @cuisine = assign(:cuisine, Cuisine.create!(
      :type => ""
    ))
  end

  it "renders the edit cuisine form" do
    render

    assert_select "form[action=?][method=?]", cuisine_path(@cuisine), "post" do

      assert_select "input#cuisine_type[name=?]", "cuisine[type]"
    end
  end
end
