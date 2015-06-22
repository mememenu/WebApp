require 'rails_helper'

RSpec.describe 'ingredients/index', :type => :view do
  let(:ingredient1) { FactoryGirl.create(:ingredient, name: 'Garlic') }
  let(:ingredient2) { FactoryGirl.create(:ingredient, name: 'Pepper') }

  before(:each) do
    assign(:ingredients, [ingredient1, ingredient2])
    render
  end

  it 'renders a title' do
    expect(rendered).to have_css('h1', text: 'Listing ingredients')
  end

  it 'renders the table header' do
    expect(rendered).to have_css('thead th', text: 'Name')
  end

  it 'renders a list of ingredients' do
    expect(rendered).to have_css('tbody td', text: 'Garlic')
    expect(rendered).to have_css('tbody td', text: 'Pepper')
    expect(rendered).to have_link('Show', href: ingredient_path(ingredient1))
    expect(rendered).to have_link('Edit', href: edit_ingredient_path(ingredient1))
    expect(rendered).to have_link('Destroy', href: ingredient_path(ingredient1))
    expect(rendered).to have_link('Show', href: ingredient_path(ingredient2))
    expect(rendered).to have_link('Edit', href: edit_ingredient_path(ingredient2))
    expect(rendered).to have_link('Destroy', href: ingredient_path(ingredient2))
  end

  it 'renders a link to create a new ingredient' do
    expect(rendered).to have_link('New Ingredient', href: new_ingredient_path)
  end
end
