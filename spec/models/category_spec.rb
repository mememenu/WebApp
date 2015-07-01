require 'rails_helper'

RSpec.describe Category, :type => :model do
  let(:category) { FactoryGirl.create(:category) }
  let(:menu) { category.menu }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:menu_id) }
  it { should validate_presence_of(:restaurant_id) }

  it "should be destroyed if corresponding menu is destroyed" do
    menu.destroy
    expect(Menu.count).to eq(0)
    expect(Category.count).to eq(0)
  end

  it "should become hidden when corresponding menu becomes hidden" do
    category.update_attributes(hide: false)
    menu.update_attributes(hide: true)

    expect(category.reload.hide).to be_truthy
  end

  it "should become unhidden when corresponding restaurant becomes unhidden" do
    category.update_attributes(hide: true)
    menu.update_attributes(hide: false)

    expect(category.reload.hide).to be_falsy
  end
end
