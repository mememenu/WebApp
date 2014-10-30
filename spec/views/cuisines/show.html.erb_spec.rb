require 'rails_helper'

RSpec.describe "cuisines/show", :type => :view do
  before(:each) do
    @cuisine = assign(:cuisine, Cuisine.create!(
      :type => "Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Type/)
  end
end
