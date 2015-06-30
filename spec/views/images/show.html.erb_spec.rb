require 'rails_helper'

RSpec.describe 'images/show', :type => :view do
  let(:image) { FactoryGirl.create(:image, :with_avatar) }

  before(:each) do
    assign(:image, image)
    render
  end

  it 'renders attributes in <p>' do
    expect(rendered).to have_css('p', text: 'Dish:')
    expect(rendered).to have_css('p', text: image.dish.name)
  end

  it 'renders the image' do
    expect(rendered).to have_css("img[src*='#{image.avatar.url(:large)}']")
  end

  it 'renders a link to edit and to go back' do
    expect(rendered).to have_link('Edit', href: edit_image_path(image))
    expect(rendered).to have_link('Back', href: dish_path(image.dish))
  end
end
