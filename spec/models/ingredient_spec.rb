require 'rails_helper'

RSpec.describe Ingredient, :type => :model do
  
  before :each do
    @restaurant = Restaurant.create(name: "Mmmm", address_1: "123 fake lane", address_2: "apartment 4", city: "Miami", state: "FL", zipcode: "33132", phone: "1234567890", description: "tasty food", dollars: 2, reservations: true, zone: "Miami", slug: "Mmmm")
  end

  it "should save if name, description and restaurant_id presence is true" do
    expect(Ingredient.count).to eq(0)
    ing = Ingredient.new
    ing.name = "parsley aioli"
    ing.description = "mayo and olive oil with parsely"
    ing.restaurant_id = @restaurant.id
    ing.save
    expect(Ingredient.count).to eq(1)
  end

  it "should not save if name presence is not true" do
    expect(Ingredient.count).to eq(0)
    ing = Ingredient.new
    ing.description = "mayo and olive oil with parsely"
    ing.restaurant_id = @restaurant.id
    ing.save
    expect(Ingredient.count).to eq(0)
    expect { raise StandardError }.to raise_error
  end

  it "should not save if restaurant_id presence is not true" do
    expect(Ingredient.count).to eq(0)
    ing = Ingredient.new
    ing.name = "parsley aioli"
    ing.description = "mayo and olive oil with parsely"
    ing.save
    expect(Ingredient.count).to eq(0)
    expect { raise StandardError }.to raise_error
  end

end
