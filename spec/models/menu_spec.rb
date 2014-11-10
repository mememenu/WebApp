require 'rails_helper'

RSpec.describe Menu, :type => :model do
  before :each do
    @restaurant = Restaurant.create(name: "Mmmm", address_1: "123 fake lane", address_2: "apartment 4", city: "Miami", state: "FL", zipcode: "33132", phone: "1234567890", description: "tasty food", dollars: 2, reservations: true)
  end
  
  def create_menu
    @menu = Menu.new
    @menu.name = "Lunch"
    @menu.save
  end

  def create_restaurant_menu
    @restaurant_menu = RestaurantMenu.new
    @restaurant_menu.menu_id = @menu.id
    @restaurant_menu.restaurant_id = @restaurant.id
    @restaurant_menu.save
    expect(RestaurantMenu.count).to eq(1)
  end

  it "should save successfully when all information present" do
    expect(Menu.count).to eq(0)
    create_menu
    expect(Menu.count).to eq(1)
  end

  it "should become hidden when corresponding restaurant becomes hidden" do 
    create_menu
    create_restaurant_menu

    @restaurant.hide = true
    @restaurant.save

    @restaurant.reload
    @menu.reload

    expect(@menu.hide).to eq(@restaurant.hide)
  end


  it "should become unhidden if restaurant becomes unhidden" do
    create_menu
    create_restaurant_menu

    @restaurant.hide = true
    @restaurant.save

    @restaurant.reload
    @menu.reload

    expect(@menu.hide).to eq(@restaurant.hide)

    @restaurant.hide = false
    @restaurant.save

    @restaurant.reload
    @menu.reload

    expect(@menu.hide).to eq(@restaurant.hide)
  end

end
