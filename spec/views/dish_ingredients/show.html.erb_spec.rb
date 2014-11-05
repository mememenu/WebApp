require 'rails_helper'

RSpec.describe "dish_ingredients/show", :type => :view do
  before(:each) do
    @dish_ingredient = assign(:dish_ingredient, DishIngredient.create!(
      :dish => nil,
      :ingredient => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
