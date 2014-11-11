require 'rails_helper'

RSpec.describe Dish, :type => :model do
  
  before :each do 
    @restaurant = Restaurant.create!(name: "Mmmm", address_1: "123 fake lane", address_2: "apartment 4", city: "Miami", state: "FL", zipcode: "33132", phone: "1234567890", description: "tasty food", dollars: 2, reservations: true)
    @menu = Menu.create!(name: "Lunch")
    @restaurant_menu = RestaurantMenu.create!(restaurant_id: @restaurant.id, menu_id: @menu.id)
    @category = Category.create!(name: 'Appetizer', menu_id: @menu.id)
  end

  def create_category
    expect(Dish.count).to eq(0)
    @dish = Dish.new
    @dish.name = "Cheese"
    @dish.description = "It tastes really good"
    @dish.portion_size = "full"
    @dish.spice = 3
    @dish.hot = true
    @dise.gluten_free = false
    @dish.vegetarian = false
    @dish.category_id = @category.id
    @dish.hide = false
    @dish.save
    expect(Dish.count).to eq(1)
  end

end
