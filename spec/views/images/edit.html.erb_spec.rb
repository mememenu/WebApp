require 'rails_helper'

RSpec.describe "images/edit", :type => :view do
  let(:image) { FactoryGirl.create(:image, :with_avatar) }
  before(:each) do
    assign(:image, image)
    render
  end

  it 'renders the edit image form' do
    expect(rendered).to render_template('images/_form')
  end

  it 'renders a link to show' do
    expect(rendered).to have_link('Show', href: image_path(image.id))
  end

  it 'renders a link to go back' do
    expect(rendered).to have_link('Back', href: dish_path(image.dish))
  end
end
