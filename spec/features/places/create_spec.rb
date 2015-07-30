require 'rails_helper'

RSpec.feature 'Creating a place', type: :feature do
  background do
    login_as FactoryGirl.create(:admin)
    visit 'places/new'
  end

  scenario 'with valid data' do
    fill_in 'Name', with: 'Awesome Restaurant'
    fill_in 'Address', with: '742 Evergreen Terrace'
    fill_in 'City', with: 'Springfield'
    select  'Florida', from: 'State'
    fill_in 'Zipcode', with: '90210'
    fill_in 'Zone', with: 'Twilight'
    select  'MIA', from: 'Region'
    fill_in 'Phone', with: '0123456789'
    fill_in 'Website URL', with: 'http://www.meme.menu/'
    fill_in 'Facebook URL', with: 'https://www.facebook.com/mememenu'
    fill_in 'Twitter URL', with: '_mememenu'
    fill_in 'Instagram URL', with: 'https://instagram.com/meme.menu/'
    fill_in 'Photographer Handle', with: 'meme.menu'
    fill_in 'Delivery url', with: 'http://delivery.com'
    fill_in 'Foursquare ID', with: 'meme_menu'
    fill_in 'iOS Status Message', with: 'Ok'
    attach_file 'Add Restaurant Logo', 'spec/fixtures/images/896x1052.jpeg'
    attach_file 'Add Restaurant Tile for IOS', 'spec/fixtures/images/896x1052.jpeg'
    attach_file 'Add Restaurant Page Header Image for IOS', 'spec/fixtures/images/896x1052.jpeg'
    attach_file 'Add Restaurant Banner for IOS', 'spec/fixtures/images/896x1052.jpeg'
    check 'Hide'

    click_button 'Save'

    expect(page).to have_css('.title-restaurant', text: 'AWESOME RESTAURANT')
    expect(page).to have_css('.alert.alert-success', text: 'Restaurant was successfully created.')
  end
end