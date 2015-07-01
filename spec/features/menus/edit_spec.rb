require 'rails_helper'

RSpec.feature 'Editing a menu', type: :feature do
  let(:menu) { FactoryGirl.create(:menu) }

  background do
    login_as FactoryGirl.create(:admin)
    visit edit_menu_path(menu)
  end

  scenario 'updates menu\'s info' do
    fill_in 'Menu Name', with: 'Edited Menu'
    select 'Sixth', from: 'Meal Order'

    click_button 'Submit'

    expect(page).to have_css('.alert.alert-success', text: 'Menu was successfully updated.')
    expect(page.current_url).to eq(restaurant_url(menu.restaurant))
  end
end
