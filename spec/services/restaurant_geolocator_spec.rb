require 'rails_helper'

describe PlaceGeolocator, type: :services do
  describe "#call" do
    context "success" do
      before do
        @place_wo_coordinates_1 = FactoryGirl.create(:place)
        @place_wo_coordinates_1.update_columns(latitude: nil, longitude: nil)

        @place_wo_coordinates_2 = FactoryGirl.create(:place)
        @place_wo_coordinates_2.update_columns(latitude: nil, longitude: nil)
      end

      it "geolocates only the specified places" do
        result = PlaceGeolocator.call([@place_wo_coordinates_1])

        expect(result[:success]).to eq(1)
        expect(result[:failed]).to eq(0)
        expect(@place_wo_coordinates_2.reload.latitude).to be_nil
        expect(@place_wo_coordinates_2.reload.longitude).to be_nil
        expect(@place_wo_coordinates_1.reload.latitude).not_to be_nil
        expect(@place_wo_coordinates_1.reload.longitude).not_to be_nil
      end

      it "geolocates all places if none are specified" do
        result = PlaceGeolocator.call

        expect(result[:success]).to eq(2)
        expect(result[:failed]).to eq(0)
        expect(@place_wo_coordinates_2.reload.latitude).not_to be_nil
        expect(@place_wo_coordinates_2.reload.longitude).not_to be_nil
        expect(@place_wo_coordinates_1.reload.latitude).not_to be_nil
        expect(@place_wo_coordinates_1.reload.longitude).not_to be_nil
      end
    end

    context "failed" do
      it "fails it latitude or longitud are not present after geolocating it" do
        Geocoder::Lookup::Test.add_stub(
          "dummy st, Miami, FL, 11111", [
            {
              'latitude'     => '',
              'longitude'    => '',
              'address'      => 'dummy st',
              'state'        => 'Florida',
              'state_code'   => 'FL',
              'country'      => 'United States',
              'country_code' => 'US'
            }
          ]
        )
        place = FactoryGirl.create(
          :place,
          address_1: 'dummy st',
          city: 'Miami',
          state: 'FL',
          zipcode: '11111'
        )
        place.update_columns(latitude: 20, longitude: -80)
        result = PlaceGeolocator.call

        expect(result[:success]).to eq(0)
        expect(result[:failed]).to eq(1)
        expect(place.reload.latitude).to eq(20)
        expect(place.reload.longitude).to eq(-80)
      end
    end
  end
end
