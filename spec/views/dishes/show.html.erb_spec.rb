require 'rails_helper'

RSpec.describe 'dishes/show', :type => :view do
  let(:image) { FactoryGirl.create(:image, :with_avatar) }
  let(:dish) do
    FactoryGirl.create(
      :dish,
      :with_avatar,
      name: 'Name',
      description: 'My Description',
      category: FactoryGirl.create(:category, name: 'My Category'),
      portion_size: 'Portion Size',
      spice: 1,
      hot: false,
      gluten_free: true,
      vegetarian: true
    )
  end

  before(:each) do
    assign(:dish, dish)
    assign(:images, [image])
    allow(view).to receive(:current_user).and_return(nil)
    render
  end

  it 'renders attributes in <p>' do
    expect(rendered).to have_css('p', text: 'Name')
    expect(rendered).to have_css('p', text: 'My Description')
    expect(rendered).to have_css('p', text: 'Served Cold')
    expect(rendered).to have_css('p', text: 'Gluten Free')
    expect(rendered).to have_css('p', text: 'Vegetarian Dish')
    expect(rendered).to have_css('p', text: 'Size:')
    expect(rendered).to have_css('p', text: 'Portion Size')
    expect(rendered).to have_css('p', text: 'Spice:')
    expect(rendered).to have_css('p', text: '1/5')
  end

  it 'renders the images' do
    expect(rendered).to have_css("img[src*='#{dish.avatar.url(:medium)}']")
    expect(rendered).to have_css("img[src*='#{image.avatar.url(:medium)}']")
  end

  it 'renders a link to go back to the restaurant' do
    expect(rendered).to have_link('Back to Restaurant', href: restaurant_path(dish.restaurant))
  end

  context 'with admin' do
    before do
      assign(:dish, dish)
      assign(:images, [image])
      assign(:image, Image.new)
      allow(view).to receive(:current_user).and_return(FactoryGirl.create(:admin))
      render
    end

    it 'renders the admin panel' do
      expect(rendered).to have_css('h3', text: 'Administrator Panel')
      expect(rendered).to have_link('Edit Dish Details', href: edit_dish_path(dish))
      expect(rendered).to have_css('h3', text: 'Dish Images')
      expect(rendered).to have_css("img[src*='#{image.avatar.url(:thumb)}']")
      expect(rendered).to have_link('Edit Image', href: edit_image_path(image))
      expect(rendered).to have_css('h5', text: 'Add Additional Images')
      expect(rendered).to render_template('images/_form')
    end
  end
end
