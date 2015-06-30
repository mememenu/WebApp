require 'rails_helper'

RSpec.describe Menu, type: :model do
  let(:menu) { FactoryGirl.create(:menu) }
  let(:restaurant) { menu.restaurant }

  it "becomes hidden when corresponding restaurant becomes hidden" do
    menu.update_attributes(hide: false)
    restaurant.update_attributes(hide: true)

    expect(menu.reload.hide).to be_truthy
  end

  it "becomes unhidden if restaurant becomes unhidden" do
    menu.update_attributes(hide: true)
    restaurant.update_attributes(hide: false)

    expect(menu.reload.hide).to be_falsy
  end

  it "gets destroyed when corresponding restaurant is destroyed" do
    restaurant.destroy

    expect(Restaurant.count).to eq(0)
    expect(Menu.count).to eq(0)
  end
end
