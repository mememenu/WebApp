require 'rails_helper'

RSpec.describe Menu, type: :model do
  let(:menu) { FactoryGirl.create(:menu) }
  let(:place) { menu.place }

  it "becomes hidden when corresponding place becomes hidden" do
    menu.update_attributes(hide: false)
    place.update_attributes(hide: true)

    expect(menu.reload.hide).to be_truthy
  end

  it "becomes unhidden if place becomes unhidden" do
    menu.update_attributes(hide: true)
    place.update_attributes(hide: false)

    expect(menu.reload.hide).to be_falsy
  end

  it "gets destroyed when corresponding place is destroyed" do
    place.destroy

    expect(Place.count).to eq(0)
    expect(Menu.count).to eq(0)
  end
end
