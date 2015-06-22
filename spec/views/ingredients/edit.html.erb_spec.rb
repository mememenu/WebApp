require 'rails_helper'

RSpec.describe 'ingredients/edit', :type => :view do
  let(:ingredient) { FactoryGirl.create(:ingredient) }

  before(:each) do
    assign(:ingredient, ingredient)
    render
  end

  it 'renders a title' do
    expect(rendered).to have_css('h1', text: 'Editing ingredient')
  end

  it 'renders the edit ingredient form' do
    expect(rendered).to render_template('ingredients/_form')
  end

  it 'renders link to show and back' do
    expect(rendered).to have_link('Show', href: ingredient_path(ingredient))
    expect(rendered).to have_link('Back', href: ingredients_path)
  end
end
