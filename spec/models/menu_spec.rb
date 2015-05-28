require 'rails_helper'

RSpec.describe Menu, :type => :model do
  before :each do
    @restaurant = Restaurant.create(name: "Mmmm", address_1: "123 fake lane", address_2: "apartment 4", city: "Miami", state: "FL", zipcode: "33132", phone: "1234567890", description: "tasty food", dollars: 2, reservations: true, zone: "Miami", slug: "Mmmm", foursquare_id: "foursquare_id")
  end
  
  def create_menu
    @menu = Menu.new
    @menu.name = "Lunch"
    @menu.restaurant_id = @restaurant.id
    @menu.priority = 1
    @menu.save
    expect(Menu.count).to eq(1)
  end

  it "should save successfully when all information present" do
    expect(Menu.count).to eq(0)
    create_menu
    expect(Menu.count).to eq(1)
  end

  it "should become hidden when corresponding restaurant becomes hidden" do 
    create_menu

    @restaurant.hide = true
    @restaurant.save

    @restaurant.reload
    @menu.reload

    expect(@menu.hide).to eq(@restaurant.hide)
  end


  it "should become unhidden if restaurant becomes unhidden" do
    create_menu

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

  it "should be destroyed when corresponding restaurant is destroyed" do
    create_menu

    @restaurant.destroy

    expect(Restaurant.count).to eq(0)
    expect(Menu.count).to eq(0)
  end



end
