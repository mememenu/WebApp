require 'rails_helper'

RSpec.describe 'ingredients/show', :type => :view do
  let(:ingredient) do
    FactoryGirl.create(:ingredient, description: 'Spicy')
  end

  before(:each) do
    assign(:ingredient, ingredient)
    render
  end

  it 'renders attributes in <p>' do
    expect(rendered).to have_css('p', text: 'Name:')
    expect(rendered).to have_css('p', text: ingredient.name)

    expect(rendered).to have_css('p', text: 'Description:')
    expect(rendered).to have_css('p', text: 'Spicy')

    expect(rendered).to have_css('p', text: 'Restaurant:')
    expect(rendered).to have_css('p', text: ingredient.restaurant.name)
  end

  it 'has links to edit and to go back' do
    expect(rendered).to have_link('Edit', href: edit_ingredient_path(ingredient))
    expect(rendered).to have_link('Back', href: ingredients_path)
  end
end
