require "rails_helper"

describe Api::V1::PlacesController, type: :controller do
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

  describe "#show" do
    it "validates the response has the correct schema" do
      place = FactoryGirl.create(:place_with_menus_and_categories, :with_header)
      get :show, format: :json, id: place.id

      expect(response).to be_success
      expect(response).to match_response_schema("place/show")
    end

    it "does not include hidden menus in the response" do
      place = FactoryGirl.create(:place)
      menu = FactoryGirl.create(:menu, hide: true)
      place.menus << menu

      get :show, format: :json, id: place.id

      expect(json['menus']).to be_empty
    end

    it "does not include hidden categories in the response" do
      place = FactoryGirl.create(:place)
      menu = FactoryGirl.create(:menu, place: place)
      category = FactoryGirl.create(:category, place: place, hide: true)
      menu.categories << category
      place.menus << menu

      get :show, format: :json, id: place.id

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

      get :show, format: :json, id: place.id

      expect(json['menus'].first['categories'].first['dishes']).to be_empty
    end

    it "orders categories inside menus by priority" do
      place = FactoryGirl.create(:place)
      menu = FactoryGirl.create(:menu, place: place)
      category = FactoryGirl.create(:category, place: place, priority: 2)
      category_2 = FactoryGirl.create(:category, place: place, priority: 1)
      dish = FactoryGirl.create(:dish, place: place, hide: true)
      category.dishes << dish
      menu.categories << category
      menu.categories << category_2
      place.menus << menu

      get :show, format: :json, id: place.id

      expect(json['menus'].first['categories'].first['id']).to eq(category_2.id)
    end
  end

  describe "#search" do
    it "validates the response has the correct schema" do
      FactoryGirl.create(:place, name: "Test")
      get :search, format: :json, query: "Te"

      expect(response).to be_success
      expect(response).to match_response_schema("place/search")
    end

    it "returns places with the parcial tag name in the query" do
      FactoryGirl.create(:place)
      place = FactoryGirl.create(:place)
      place.tags << FactoryGirl.create(:tag, name: "Pizza")

      get :search, format: :json, query: "Piz"

      expect(response).to be_success
      expect(json['places'].count).to eq(1)
      expect(json['places'].first['id']).to eq(place.id)
    end

    it "returns places with the parcial place name in the query" do
      FactoryGirl.create(:place)
      place = FactoryGirl.create(:place, name: "Pizza Hut")

      get :search, format: :json, query: "pi"

      expect(response).to be_success
      expect(json['places'].count).to eq(1)
      expect(json['places'].first['id']).to eq(place.id)
    end

    it "returns places with the parcial place zone in the query" do
      FactoryGirl.create(:place)
      place = FactoryGirl.create(:place, zone: "South Beach")

      get :search, format: :json, query: "sou"

      expect(response).to be_success
      expect(json['places'].count).to eq(1)
      expect(json['places'].first['id']).to eq(place.id)
    end

    it "returns all results that match" do
      FactoryGirl.create(:place)
      place = FactoryGirl.create(:place, name: "Pizza Hut")
      place_with_tag = FactoryGirl.create(:place)
      place_with_tag.tags << FactoryGirl.create(:tag, name: "Pizza")

      get :search, format: :json, query: "Piz"

      expect(response).to be_success
      expect(json['places'].count).to eq(2)
      place_ids = json['places'].map{ |p| p['id'] }
      expect(place_ids).to match_array([place_with_tag.id, place.id])
    end
  end

  describe "#index", focus: true do
    it "limits the response to 100 places" do
      FactoryGirl.create_list(:place, 101)

      get :index, format: :json

      expect(response).to be_success
      expect(json['places'].count).to eq(100)
    end

    it "has the correct schema" do
      FactoryGirl.create(:place)
      get :index, format: :json

      expect(response).to be_success
      expect(response).to match_response_schema("place/index")
    end

    context "filter by zone" do
      it "returns places for the specified zone" do
        miami_beach_place = FactoryGirl.create(:place, zone: "Miami Beach")
        FactoryGirl.create(:place, zone: "Downtown")

        get :index, format: :json, zone: "Miami Beach"

        expect(response).to be_success
        expect(json['places'].count).to eq(1)
        expect(json['places'].first['id']).to eq(miami_beach_place.id)
      end
    end

    context "filter by tag name" do
      it "returns places with the specified tag name" do
        pizza_tag = FactoryGirl.create(:tag, name: "Pizza")
        pizza_place = FactoryGirl.create(:place, tags: [pizza_tag])
        FactoryGirl.create(:place, :with_tag)

        get :index, format: :json, tag: "Pizza"

        expect(response).to be_success
        expect(json['places'].count).to eq(1)
        expect(json['places'].first['id']).to eq(pizza_place.id)
      end
    end

    context "hidden places" do
      it "does not return them" do
        unhidden_place = FactoryGirl.create(:place, hide: false)
        FactoryGirl.create(:place, hide: true)

        get :index, format: :json

        expect(response).to be_success
        expect(json['places'].count).to eq(1)
        expect(json['places'].first['id']).to eq(unhidden_place.id)
      end
    end
  end
end
