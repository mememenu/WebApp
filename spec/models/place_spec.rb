require 'rails_helper'

describe Place, :type => :model do
  let(:place) { FactoryGirl.create(:place) }

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
      FactoryGirl.create(:place, name: 'dummy place', city: 'Miami')
      invalid_place = FactoryGirl.build(:place,
                                        name: 'dummy place',
                                        city: 'Miami')

      expect(invalid_place).not_to be_valid
      error_msg = "(A place with this name already exists in this city)"
      expect(invalid_place.errors[:name].first).to eq(error_msg)
    end

    it "is valid if the name exists for a different city" do
      FactoryGirl.create(:place, name: 'dummy place', city: 'Miami')
      valid_place = FactoryGirl.build(:place,
                                      name: 'dummy place',
                                      city: 'Orlando')

      expect(valid_place).to be_valid
    end

    it "is valid if the name does not exists in any city" do
      valid_place = FactoryGirl.build(:place, name: 'dummy place')

      expect(valid_place).to be_valid
    end
  end

  it "sets place coordinates based on its full address" do
    expect(place.latitude).not_to be_nil
    expect(place.longitude).not_to be_nil
  end

  it "does not fetch coordinates again if full address components did not change" do
    place

    expect(Geocoder).not_to receive(:search)
    place.save
  end

  it "has address_2 default value as an empty string" do
    expect(Place.new.address_2).to eq("")
  end

  it "formats phone correctly when calling #formatted_phone" do
    expect(place.formatted_phone).to eq("(012) 345-6789")
  end

  context "quotes length validation" do
    it "is invalid if it has more than 3 quotes" do
      place = FactoryGirl.build(:place, quotes: ['first', 'second', 'third', 'fourth'])

      expect(place).not_to be_valid
    end

    it "is valid if it has 3 quotes" do
      place = FactoryGirl.build(:place, quotes: ['first', 'second', 'third'])

      expect(place).to be_valid
    end
  end
end
