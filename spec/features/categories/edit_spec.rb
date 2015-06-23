require 'rails_helper'

RSpec.feature 'Editing a category', type: :feature do
  let(:category) { FactoryGirl.create(:category) }

  background do
    login_as FactoryGirl.create(:admin)
    visit edit_category_path(category)
  end

  scenario 'updates the category\'s info' do
    fill_in 'Category Name', with: 'Edited Category'
    select 'Sixth', from: 'Course'

    click_button 'Submit'

    expect(page).to have_css('.alert.alert-success', text: 'Category was successfully updated.')
    expect(page.current_url).to eq(restaurant_url(category.restaurant))
  end
end
