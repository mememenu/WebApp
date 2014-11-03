require 'rails_helper'

RSpec.describe "dishes/show", :type => :view do
  before(:each) do
    @dish = assign(:dish, Dish.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Category/)
    expect(rendered).to match(/Category Display/)
    expect(rendered).to match(/Portion Size/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
