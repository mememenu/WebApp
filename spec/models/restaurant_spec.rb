require 'rails_helper'

RSpec.describe Restaurant, :type => :model do
  
  it "should save a restaurant if all validations pass" do
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
    rest.save
    expect(Restaurant.count).to eq(1)
  end


end
