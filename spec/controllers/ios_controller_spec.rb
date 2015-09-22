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
end
