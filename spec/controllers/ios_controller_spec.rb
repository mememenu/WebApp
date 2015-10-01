require 'rails_helper'

describe IosController, type: :controller do
  describe "#nearby" do
    it "answers bad request if distance is not sent" do
      get :nearby, format: :json, location: ['20', '-80']

      expect(response).to be_a_bad_request
    end

    it "answers bad request if location is not sent" do
      get :nearby, format: :json, distance: 20

      expect(response).to be_a_bad_request
    end

    context "answers bad request if location is sent but no right" do
      it "is not an Array" do
        get :nearby, format: :json, location: "20, -80", distance: 10

        expect(response).to be_a_bad_request
      end

      it "is an Array but does not have 2 items" do
        get :nearby, format: :json, location: ["20"], distance: 10

        expect(response).to be_a_bad_request
      end

      it "has a blank value" do
        get :nearby, format: :json, location: ["20", ""], distance: 10

        expect(response).to be_a_bad_request
      end
    end

    it "validates the response has the correct schema" do
      FactoryGirl.create(:place, :with_banner)
      get :nearby, format: :json, location: ["25.7982813", "-80.1283682"], distance: 10

      expect(response).to be_success
      expect(response).to match_response_schema("place/nearby")
    end

    it "does not return hidden places" do
      FactoryGirl.create(:place, :with_banner, hide: true)
      get :nearby, format: :json, location: ["25.7982813", "-80.1283682"], distance: 10

      expect(response).to be_success
      expect(json['places'].count).to be_zero
    end
  end

  describe "place_info" do
    it "validates the response has the correct schema" do
      place = FactoryGirl.create(:place_with_menus_and_categories, :with_header)
      get :place_info, format: :json, id: place.id

      expect(response).to be_success
      expect(response).to match_response_schema("place/show")
    end

    it "does not include hidden menus in the response" do
      place = FactoryGirl.create(:place)
      menu = FactoryGirl.create(:menu, hide: true)
      place.menus << menu

      get :place_info, format: :json, id: place.id

      expect(json['menus']).to be_empty
    end

    it "does not include hidden categories in the response" do
      place = FactoryGirl.create(:place)
      menu = FactoryGirl.create(:menu, place: place)
      category = FactoryGirl.create(:category, place: place, hide: true)
      menu.categories << category
      place.menus << menu

      get :place_info, format: :json, id: place.id

      expect(json['menus'].first['categories']).to be_empty
    end

    it "does not include hidden dishes in the response" do
      place = FactoryGirl.create(:place)
      menu = FactoryGirl.create(:menu, place: place)
      category = FactoryGirl.create(:category, place: place)
      dish = FactoryGirl.create(:dish, place: place, hide: true)
      category.dishes << dish
      menu.categories << category
      place.menus << menu

      get :place_info, format: :json, id: place.id

      expect(json['menus'].first['categories'].first['dishes']).to be_empty
    end
  end
end
