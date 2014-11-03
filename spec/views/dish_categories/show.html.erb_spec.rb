require 'rails_helper'

RSpec.describe "dish_categories/show", :type => :view do
  before(:each) do
    @dish_category = assign(:dish_category, DishCategory.create!(
      :category => nil,
      :dish => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
