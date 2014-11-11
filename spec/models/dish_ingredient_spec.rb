require 'rails_helper'

RSpec.describe DishIngredient, :type => :model do
  
  before :each do 
    @restaurant = Restaurant.create!(name: "Mmmm", address_1: "123 fake lane", address_2: "apartment 4", city: "Miami", state: "FL", zipcode: "33132", phone: "1234567890", description: "tasty food", dollars: 2, reservations: true)
    @menu = Menu.create!(name: "Lunch")
    @restaurant_menu = RestaurantMenu.create!(restaurant_id: @restaurant.id, menu_id: @menu.id)
    @category = Category.create!(name: 'Appetizer', menu_id: @menu.id)
    @dish = Dish.create!(name: "pork belly", category_id: @category.id, portion_size: 'full', spice: 3)
    @ingredient = Ingredient.create!(name: "parsley aioli", restaurant_id: @restaurant.id)
  end

  def create_dish_ingredient
    @dish_ingredient = DishIngredient.new
    @dish_ingredient.dish_id = @dish.id
    @dish_ingredient.ingredient_id = @ingredient.id
    @dish_ingredient.save
  end

  it "should not save if dish_id is not present" do
    expect(DishIngredient.count).to eq(0)   
    @dish_ingredient = DishIngredient.new
    @dish_ingredient.ingredient_id = @ingredient.id
    @dish_ingredient.save
    expect(DishIngredient.count).to eq(0)
    expect { raise StandardError }.to raise_error  
  end

  it "should not save if ingredient_id is not present" do
    expect(DishIngredient.count).to eq(0)   
    @dish_ingredient = DishIngredient.new
    @dish_ingredient.dish_id = @dish.id
    @dish_ingredient.save
    expect(DishIngredient.count).to eq(0)
    expect { raise StandardError }.to raise_error
  end

  it "should save if dish_ingredient instance has dish and ingredient associated with it" do
    expect(DishIngredient.count).to eq(0)   
    create_dish_ingredient
    expect(DishIngredient.count).to eq(1)
  end

  it "should destroy dish_ingredient instance if dependent dish is destroyed" do
    create_dish_ingredient
    @dish.destroy
    expect(DishIngredient.count).to eq(0)
    expect(Dish.count).to eq(0)
  end

  it "should destroy dish_ingredient instance if dependent ingredient is destroyed" do
    create_dish_ingredient
    @ingredient.destroy
    expect(DishIngredient.count).to eq(0)
    expect(Ingredient.count).to eq(0)
  end

end
