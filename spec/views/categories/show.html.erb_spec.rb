require 'rails_helper'

RSpec.describe "categories/show", :type => :view do
  it "renders attributes in <p>" do
    category = FactoryGirl.create(:category, name: 'Name')
    assign(:category, category)
    assign(:categories, [category])
    assign(:dishes, [])
    render
    expect(rendered).to match(/Name/)
  end
end
