require 'rails_helper'

RSpec.feature 'Show', type: :feature do
  background do
    place = FactoryGirl.create(:place_with_menus_and_categories)
    login_as FactoryGirl.create(:admin)
    visit place_path(place)
  end

  scenario 'creating a dish' do
    within('#new_dish') do
      fill_in 'Dish Name', with: 'Chicken'
      fill_in 'Description', with: 'Tasty'
      select 'Test Menu 1', from: 'Menu'
      select 'Test Category 1', from: 'Category'
      check 'Hide Dish'
      attach_file 'Default Image', 'spec/fixtures/images/896x1052.jpeg'

      click_button 'Submit'
    end

    expect(page).to have_css('.alert.alert-success', text: 'Dish was successfully created.')
  end

  scenario 'creating a category' do
    click_on 'Categories'

    within('#new_category') do
      fill_in 'Category Name', with: 'Awesome Category'
      select 'Test Menu 1', from: 'Menu'
      select 'First', from: 'Course'
      check 'Hide'

      click_button 'Submit'
    end

    expect(page).to have_css('.alert.alert-success', text: 'Category was successfully created.')
  end

  scenario 'creating a menu' do
    click_on 'Menus'

    within('#new_menu') do
      fill_in 'Menu Name', with: 'Awesome Menu'
      select 'First', from: 'Meal Order'
      check 'Hide'

      click_button 'Submit'
    end

    expect(page).to have_css('.alert.alert-success', text: 'Menu was successfully created.')
  end
end
