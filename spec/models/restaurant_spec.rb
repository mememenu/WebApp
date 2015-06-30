require 'rails_helper'

describe Restaurant, :type => :model do
  let(:restaurant) { FactoryGirl.create(:restaurant) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:address_1) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_length_of(:state).is_equal_to(2) }
  it { should validate_presence_of(:zipcode) }
  it { should validate_numericality_of(:zipcode) }
  it { should validate_length_of(:zipcode).is_equal_to(5) }
  it { should validate_presence_of(:phone) }
  it { should validate_numericality_of(:phone) }
  it { should validate_length_of(:phone).is_equal_to(10) }
  it { should validate_presence_of(:zone) }
  it { should validate_presence_of(:foursquare_id) }

  context "name uniqueness scoped to city" do
    it "is invalid if the name already exists for that city" do
      FactoryGirl.create(:restaurant, name: 'dummy restaurant', city: 'Miami')
      invalid_restaurant = FactoryGirl.build(:restaurant,
                                             name: 'dummy restaurant',
                                             city: 'Miami')

      expect(invalid_restaurant).not_to be_valid
      error_msg = "(A restaurant with this name already exists in this city)"
      expect(invalid_restaurant.errors[:name].first).to eq(error_msg)
    end

    it "is valid if the name exists for a different city" do
      FactoryGirl.create(:restaurant, name: 'dummy restaurant', city: 'Miami')
      valid_restaurant = FactoryGirl.build(:restaurant,
                                           name: 'dummy restaurant',
                                           city: 'Orlando')

      expect(valid_restaurant).to be_valid
    end

    it "is valid if the name does not exists in any city" do
      valid_restaurant = FactoryGirl.build(:restaurant, name: 'dummy restaurant')

      expect(valid_restaurant).to be_valid
    end
  end

  it "sets restaurant coordinates based on its full address" do
    expect(restaurant.latitude).not_to be_nil
    expect(restaurant.longitude).not_to be_nil
  end

  it "does not fetch coordinates again if full address components did not change" do
    restaurant

    expect(Geocoder).not_to receive(:search)
    restaurant.save
  end
end
