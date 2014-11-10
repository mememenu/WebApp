require 'rails_helper'

RSpec.describe Category, :type => :model do

  before :each do 
    @restaurant = Restaurant.create!(name: "Mmmm", address_1: "123 fake lane", address_2: "apartment 4", city: "Miami", state: "FL", zipcode: "33132", phone: "1234567890", description: "tasty food", dollars: 2, reservations: true)
    @menu = Menu.create!(name: "Lunch")
    @restaurant_menu = RestaurantMenu.create!(restaurant_id: @restaurant.id, menu_id: @menu.id)
  end

  def create_category
    expect(Category.count).to eq(0)
    @category = Category.new
    @category.name = "Appetizer"
    @category.menu_id = @menu.id
    @category.hide = false
    @category.save
    expect(Category.count).to eq(1)
  end

  it "should save succesfully with name and menu_id" do
    create_category
  end

  it "should not save if name is not present" do 
    expect(Category.count).to eq(0)
    @category = Category.new
    @category.menu_id = @menu.id
    @category.save
    expect(Category.count).to eq(0)
    expect { raise StandardError }.to raise_error
  end

  it "should not save if menu_id is not present" do
    expect(Category.count).to eq(0)
    @category = Category.new
    @category.name = "Appetizer"
    @category.save
    expect(Category.count).to eq(0)
    expect { raise StandardError }.to raise_error
  end

  it "should be destroyed if corresponding menu is destroyed" do
    create_category

    @menu.destroy
    expect(Menu.count).to eq(0)
    expect(RestaurantMenu.count).to eq(0)
    expect(Category.count).to eq(0)
  end

  it "should become hidden when corresponding menu becomes hidden" do
    create_category
    expect(@category.hide).to eq(false)

    @menu.hide = true
    @menu.save
    @menu.reload

    @category.reload
    expect(@category.hide).to eq(@menu.hide)
  end

  it "should become unhidden when corresponding restaurant becomes unhidden" do 
    create_category
    expect(@category.hide).to eq(false)

    @menu.hide = true
    @menu.save
    @menu.reload
    @category.reload
    expect(@category.hide).to eq(@menu.hide)

    @menu.hide = false
    @menu.save
    @menu.reload
    @category.reload
    expect(@category.hide).to eq(@menu.hide)
  end


end
