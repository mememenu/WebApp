require 'rails_helper'

RSpec.feature 'Editing a restaurant', type: :feature do
  let(:restaurant) { FactoryGirl.create(:restaurant) }

  background do
    login_as FactoryGirl.create(:admin)
    visit edit_restaurant_path(restaurant)
  end

  scenario 'updates the restaurant\'s info' do
    fill_in 'Name', with: 'The Dutch'
    fill_in 'Address', with: '742 Evergreen Terrace'

    click_button 'Update Restaurant'

    expect(page).to have_css('.title-restaurant', text: 'THE DUTCH')
    expect(page.current_url).to eq(restaurant_url(restaurant))
  end
end
