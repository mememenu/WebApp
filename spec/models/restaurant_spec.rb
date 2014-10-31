require 'rails_helper'

RSpec.describe Restaurant, :type => :model do
  
  before :each do 
    @cuisine = Cuisine.create(genre: "Italian")
  end

  #Refactor this method with an options hash in order to make it more usable.
  def create_restaurant
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
    @rest.cuisine_ids = @cuisine.id
    @rest.save
  end



  it "should save a restaurant if all validations pass" do
    expect(Cuisine.count).to eq(1)
    expect(Restaurant.count).to eq(0)
    create_restaurant
    expect(Restaurant.count).to eq(1)
  end

  it "should not save if no cuisine genre is selected" do
    expect(Cuisine.count).to eq(1)

    expect(Restaurant.count).to eq(0)
    rest = Restaurant.new
    rest.name = "mmmm"
    rest.address_1 = "123 fake lane"
    rest.address_2 = "apartment 4"
    rest.city = "miami"
    rest.state = "fl"
    rest.zipcode = "33134"
    rest.phone = "3059999999"
    rest.description = "tasty treats for you"
    rest.dollars = 4
    rest.reservations = true
    rest.cuisine_ids = nil
    rest.save
    expect { raise StandardError }.to raise_error
    expect(Restaurant.count).to eq(0)
  end

  it "should not save if name and city are not unique to that restaurant" do
    expect(Cuisine.count).to eq(1)
    expect(Restaurant.count).to eq(0)
    create_restaurant
    expect(Restaurant.count).to eq(1)

    rest2 = Restaurant.new
    rest2.name = "mmmm"
    rest2.address_1 = "456 fake faker"
    rest2.address_2 = "Unit 10"
    rest2.city = "miami"
    rest2.state = "fl"
    rest2.zipcode = "12345"
    rest2.phone = "0987654321"
    rest2.description = "yummy"
    rest2.dollars = 2
    rest2.reservations = false
    rest2.cuisine_ids = @cuisine.id
    rest2.save
    expect{ raise "(A restaurant with this name already exists in this city)" }.to raise_error
    expect(Restaurant.count).to eq(1)
  end

  it "should not save if restaurant state is not 2 characters" do
    expect(Cuisine.count).to eq(1)
    expect(Restaurant.count).to eq(0)

    rest = Restaurant.new
    rest.name = "mmmm"
    rest.address_1 = "123 fake lane"
    rest.address_2 = "apartment 4"
    rest.city = "miami"
    rest.state = "Florida"
    rest.zipcode = "33134"
    rest.phone = "3059999999"
    rest.description = "tasty treats for you"
    rest.dollars = 4
    rest.reservations = true
    rest.cuisine_ids = @cuisine.id
    rest.save
    expect { raise StandardError }.to raise_error
    expect(Restaurant.count).to eq(0)
  end

    it "should not save if restaurant phone number is not 10 characters" do
    expect(Cuisine.count).to eq(1)
    expect(Restaurant.count).to eq(0)
    
    rest = Restaurant.new
    rest.name = "mmmm"
    rest.address_1 = "123 fake lane"
    rest.address_2 = "apartment 4"
    rest.city = "miami"
    rest.state = "FL"
    rest.zipcode = "33134"
    rest.phone = "123456789"
    rest.description = "tasty treats for you"
    rest.dollars = 4
    rest.reservations = true
    rest.cuisine_ids = @cuisine.id
    rest.save
    expect { raise StandardError }.to raise_error
    expect(Restaurant.count).to eq(0)
  end

end