require 'rails_helper'

RSpec.feature 'Editing a place', type: :feature do
  let(:place) { FactoryGirl.create(:place) }

  background do
    login_as FactoryGirl.create(:admin)
    visit edit_place_path(place)
  end

  scenario 'updates the place\'s info' do
    fill_in 'Name', with: 'The Dutch'
    fill_in 'Address', with: '742 Evergreen Terrace'

    click_button 'Save'

    expect(page).to have_css('.title-restaurant', text: 'THE DUTCH')
    expect(page.current_url).to eq(place_url(place))
  end
end
