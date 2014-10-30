require 'rails_helper'

RSpec.describe Restaurant, :type => :model do
  

  def create_cuis
    @cui = Cuisine.new
    @cui.genre = "Italian"
    @cui.save
  end

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
    @rest.cuisine_ids = @cui.id
    @rest.save
  end

  it "should save a restaurant if all validations pass" do
    expect(Cuisine.count).to eq(0)
    create_cuis
    expect(Cuisine.count).to eq(1)

    expect(Restaurant.count).to eq(0)
    create_rest
    expect(Restaurant.count).to eq(1)
  end

  it "should not save if no cuisine genre is selected" do
    expect(Cuisine.count).to eq(0)
    create_cuis
    expect(Cuisine.count).to eq(1)

    expect(Restaurant.count).to eq(0)
    rest_2 = Restaurant.new
    rest_2.name = "mmmm"
    rest_2.address_1 = "123 fake lane"
    rest_2.address_2 = "apartment 4"
    rest_2.city = "miami"
    rest_2.state = "fl"
    rest_2.zipcode = "33134"
    rest_2.phone = "3059999999"
    rest_2.description = "tasty treats for you"
    rest_2.dollars = 4
    rest_2.reservations = true
    rest_2.save
    expect(Restaurant.count).to eq(0)


  end
end
