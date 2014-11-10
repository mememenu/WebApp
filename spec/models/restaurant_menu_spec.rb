require 'rails_helper'

RSpec.describe RestaurantMenu, :type => :model do
 
  before :each do 
    @restaurant = Restaurant.create(name: "Mmmm", address_1: "123 fake lane", address_2: "apartment 4", city: "Miami", state: "FL", zipcode: "33132", phone: "1234567890", description: "tasty food", dollars: 2, reservations: true)
    @menu = Menu.create(name: "Lunch")
  end

  def create_restaurant_menu
    @restaurant_menu = RestaurantMenu.new
    @restaurant_menu.menu_id = @menu.id
    @restaurant_menu.restaurant_id = @restaurant.id
    @restaurant_menu.save
  end

  it "should not save if restaurant_id is not present" do
    expect(RestaurantMenu.count).to eq(0)   
    @restaurant_menu = RestaurantMenu.new
    @restaurant_menu.menu_id = @menu.id
    @restaurant_menu.save
    expect(RestaurantMenu.count).to eq(0)  
  end

  it "should not save if menu_id is not present" do
    expect(RestaurantMenu.count).to eq(0)   
    @restaurant_menu = RestaurantMenu.new
    @restaurant_menu.restaurant_id = @restaurant.id
    @restaurant_menu.save
    expect(RestaurantMenu.count).to eq(0)
  end

  it "should save if restaurant_menu instance has restaurant and menu associated with it" do
    expect(RestaurantMenu.count).to eq(0)   
    create_restaurant_menu
    expect(RestaurantMenu.count).to eq(1)
  end

  it "should destroy restaurant_menu instance if dependent restaurant is destroyed" do
    create_restaurant_menu
    @restaurant.destroy
    expect(RestaurantMenu.count).to eq(0)
    expect(Restaurant.count).to eq(0)
  end

  it "should destroy restaurant_menu if dependent menu is destroyed" do
    create_restaurant_menu
    @menu.destroy
    expect(RestaurantMenu.count).to eq(0)
    expect(Menu.count).to eq(0)
  end

end
