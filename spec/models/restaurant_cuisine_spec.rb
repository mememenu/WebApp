require 'rails_helper'

RSpec.describe RestaurantCuisine, :type => :model do
  

  before :each do 
    @cuisine = Cuisine.create(genre: "Italian")
    @restaurant = Restaurant.create(name: "Mmmm", address_1: "123 fake lane", address_2: "apartment 4", city: "Miami", state: "FL", zipcode: "33132", phone: "1234567890", description: "tasty food", dollars: 2, reservations: true, zone: "Miami", slug: "Mmmm")
  end

  def create_restaurant_cuisine
    @restaurant_cuisine = RestaurantCuisine.new
    @restaurant_cuisine.restaurant_id = @restaurant.id
    @restaurant_cuisine.cuisine_id = @cuisine.id
    @restaurant_cuisine.save
  end


  it "associates a restaurant_cuisine instance with a restaurant and a cuisine" do
    expect(RestaurantCuisine.count).to eq(0)
    create_restaurant_cuisine
    expect(RestaurantCuisine.count).to eq(1)

    expect(@restaurant.cuisines.first.genre).to eq(@cuisine.genre)
  end

  it "destroys the restaurant_cuisine instance when dependent restaurant is destroyed" do 
    expect(RestaurantCuisine.count).to eq(0)
    create_restaurant_cuisine
    expect(RestaurantCuisine.count).to eq(1)

    expect(@restaurant.cuisines.first.genre).to eq(@cuisine.genre)

    @restaurant.destroy
    expect(Restaurant.count).to eq(0)
    expect(RestaurantCuisine.count).to eq(0)
    expect(Cuisine.count).to eq(1)
  end

  it "destroys the restaurant_cuisine instance when dependent cuisine is destroyed" do 
    expect(RestaurantCuisine.count).to eq(0)
    create_restaurant_cuisine
    expect(RestaurantCuisine.count).to eq(1)

    expect(@restaurant.cuisines.first.genre).to eq(@cuisine.genre)

    @cuisine.destroy
    expect(Restaurant.count).to eq(1)
    expect(RestaurantCuisine.count).to eq(0)
    expect(Cuisine.count).to eq(0)
  end

  it "should not save if cuisine_id is not present" do
    expect(RestaurantCuisine.count).to eq(0)
    @restaurant_cuisine = RestaurantCuisine.new
    @restaurant_cuisine.restaurant_id = @restaurant.id
    @restaurant_cuisine.save
    expect(RestaurantCuisine.count).to eq(0)
    expect { raise StandardError }.to raise_error
  end

  it "should not save if restaurant_id is not present" do
    expect(RestaurantCuisine.count).to eq(0)
    @restaurant_cuisine = RestaurantCuisine.new
    @restaurant_cuisine.cuisine_id = @cuisine.id
    @restaurant_cuisine.save
    expect(RestaurantCuisine.count).to eq(0)
    expect { raise StandardError }.to raise_error
  end



end
