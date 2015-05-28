require 'rails_helper'

RSpec.describe Dish, :type => :model do

  before :each do 
    @restaurant = Restaurant.create(name: "Mmmm", address_1: "123 fake lane", address_2: "apartment 4", city: "Miami", state: "FL", zipcode: "33132", phone: "1234567890", description: "tasty food", dollars: 2, reservations: true, zone: "Miami", slug: "Mmmm", foursquare_id: "foursquare_id")
    @menu = Menu.create(name: "Lunch", restaurant_id: @restaurant.id, priority: 1)
    @category = Category.create!(name: 'Appetizer', menu_id: @menu.id, restaurant_id: @restaurant.id, priority: 1)
  end

  def create_dish
    expect(Dish.count).to eq(0)
    @dish = Dish.new
    @dish.name = "Cheese"
    @dish.description = "It tastes really good"
    @dish.category_id = @category.id
    @dish.menu_id = @menu.id
    @dish.restaurant_id = @restaurant.id
    @dish.hide = false
    @dish.save
    expect(Dish.count).to eq(1)
  end

  it "should save succesfully with name, description, portion_size, spice, hot, gluten_free, vegetarian and category_id" do
    create_dish
  end

  # it "should not save without name" do
  #   expect(Dish.count).to eq(0)
  #   @dish = Dish.new
  #   @dish.description = "It tastes really good"
  #   @dish.category_id = @category.id
  #   @dish.menu_id = @menu.id
  #   @dish.restaurant_id = @restaurant.id
  #   @dish.hide = false
  #   @dish.save
  #   expect(Dish.count).to eq(0)
  #   expect { raise StandardError }.to raise_error
  # end

  it "should not save without a category_id" do
    expect(Dish.count).to eq(0)
    @dish = Dish.new
    @dish.name = "Cheese"
    @dish.description = "It tastes really good"
    @dish.menu_id = @menu.id
    @dish.restaurant_id = @restaurant.id
    @dish.hide = false
    @dish.save
    expect(Dish.count).to eq(0)
    expect { raise StandardError }.to raise_error
  end

  it "should not save without a menu_id" do
    expect(Dish.count).to eq(0)
    @dish = Dish.new
    @dish.name = "Cheese"
    @dish.description = "It tastes really good"
    @dish.category_id = @category.id
    @dish.restaurant_id = @restaurant.id
    @dish.hide = false
    @dish.save
    expect(Dish.count).to eq(0)
    expect { raise StandardError }.to raise_error
  end

  it "should not save without a restaurant_id" do
    expect(Dish.count).to eq(0)
    @dish = Dish.new
    @dish.name = "Cheese"
    @dish.description = "It tastes really good"
    @dish.menu_id = @menu.id
    @dish.category_id = @category.id
    @dish.hide = false
    @dish.save
    expect(Dish.count).to eq(0)
    expect { raise StandardError }.to raise_error
  end

  it "should be destroyed when its category is destroyed" do
    create_dish
    @category.destroy
    expect(Category.count).to eq(0)
    expect(Dish.count).to eq(0)
  end

  it "should become hidden when corresponding category becomes hidden" do
    create_dish
    expect(@dish.hide).to eq(false)

    @category.hide = true
    @category.save
    @category.reload

    @dish.reload
    expect(@dish.hide).to eq(@category.hide)
  end

  it "should become unhidden when corresponding category becomes unhidden" do 
    create_dish
    expect(@dish.hide).to eq(false)

    @category.hide = true
    @category.save
    @category.reload

    @dish.reload
    expect(@dish.hide).to eq(@category.hide)

    @category.hide = false
    @category.save
    @category.reload
    @dish.reload
    expect(@dish.hide).to eq(@category.hide)
  end


end
