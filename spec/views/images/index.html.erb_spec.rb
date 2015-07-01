require 'rails_helper'

RSpec.describe 'images/index', :type => :view do
  let(:dish) { FactoryGirl.create(:dish, name: 'Asado') }
  let(:image1) { FactoryGirl.create(:image, :with_avatar, dish: dish) }
  let(:image2) { FactoryGirl.create(:image, :with_avatar, dish: dish) }

  before(:each) do
    assign(:images, [image1, image2])
    render
  end

  it 'renders a title' do
    expect(rendered).to have_css('h1', text: 'Listing images')
  end

  it 'renders the table header' do
    expect(rendered).to have_css('thead th', text: 'Dish')
    expect(rendered).to have_css('thead th', text: 'Hidden')
  end

  it 'renders a list of images' do
    expect(rendered).to have_css('tbody td', text: 'Asado', count: 2)
    expect(rendered).to have_css('tbody td', text: /^$/, count: 2)
    expect(rendered).to have_link('Show', href: image_path(image1.id))
    expect(rendered).to have_link('Edit', href: edit_image_path(image1))
    expect(rendered).to have_link('Destroy', href: image_path(image1.id))
    expect(rendered).to have_link('Show', href: image_path(image2.id))
    expect(rendered).to have_link('Edit', href: edit_image_path(image2))
    expect(rendered).to have_link('Destroy', href: image_path(image2.id))
  end
end
