require 'rails_helper'

RSpec.feature 'Editing a dish', type: :feature do
  let(:dish) { FactoryGirl.create(:dish, :with_default_image) }

  background do
    login_as FactoryGirl.create(:admin)
    visit edit_dish_path(dish)
  end

  scenario 'updates the dish info' do
    fill_in 'Dish Name', with: 'Edited Dish'
    fill_in 'Description', with: 'Edited description'

    click_button 'Submit'

    expect(page).to have_css('.alert.alert-success', text: 'Dish was successfully updated.')
    expect(page.current_url).to eq(place_url(dish.place))
  end
end
