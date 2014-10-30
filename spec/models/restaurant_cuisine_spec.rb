require 'rails_helper'

RSpec.describe RestaurantCuisine, :type => :model do
  
  def create_rest
    @rest = Restaurant.new
    @rest.name = "mmmm"
    @rest.address_1 = "123 fake lane"
    @rest.address_2 = "apartment 4"
    @rest.city = "miami"
    @rest.state = "fl"
    @rest.zipcode = "33134"
    @rest.phone = "3059999999"
    @rest.description = "tasty treats for you"
    @rest.dollars = 4
    @rest.reservations = true
    @rest.save
  end

  def create_cuis
    @cuis = Cuisine.new
    @cuis.genre = "Italian"
    @cuis.save
  end

  def create_rest_cuis
    @rc = RestaurantCuisine.new
    @rc.restaurant_id = @rest.id
    @rc.cuisine_id = @cuis.id
    @rc.save
  end


  it "associates a RestaurantCuisine with a restaurant instance and cuisine instance" do
    expect(Restaurant.count).to eq(0)
    create_rest
    expect(Restaurant.count).to eq(1)

    expect(Cuisine.count).to eq(0)
    create_cuis
    expect(Cuisine.count).to eq(1)

    expect(RestaurantCuisine.count).to eq(0)
    create_rest_cuis
    expect(RestaurantCuisine.count).to eq(1)

    expect(@rest.cuisines.first.genre).to eq(@cuis.genre)
  end

  it "destroys restaurant_cuisine when restaurant is destroyed" do 
    expect(Restaurant.count).to eq(0)
    create_rest
    expect(Restaurant.count).to eq(1)

    expect(Cuisine.count).to eq(0)
    create_cuis
    expect(Cuisine.count).to eq(1)

    expect(RestaurantCuisine.count).to eq(0)
    create_rest_cuis
    expect(RestaurantCuisine.count).to eq(1)

    expect(@rest.cuisines.first.genre).to eq(@cuis.genre)

    @rest.destroy
    expect(Restaurant.count).to eq(0)
    expect(RestaurantCuisine.count).to eq(0)
    expect(Cuisine.count).to eq(1)
  end

  it "destroys restaurant_cuisine when cuisine is destroyed" do 
    expect(Restaurant.count).to eq(0)
    create_rest
    expect(Restaurant.count).to eq(1)

    expect(Cuisine.count).to eq(0)
    create_cuis
    expect(Cuisine.count).to eq(1)

    expect(RestaurantCuisine.count).to eq(0)
    create_rest_cuis
    expect(RestaurantCuisine.count).to eq(1)

    expect(@rest.cuisines.first.genre).to eq(@cuis.genre)

    @cuis.destroy
    expect(Restaurant.count).to eq(1)
    expect(RestaurantCuisine.count).to eq(0)
    expect(Cuisine.count).to eq(0)
  end



end
