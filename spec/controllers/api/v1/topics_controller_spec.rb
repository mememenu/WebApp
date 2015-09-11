require 'rails_helper'

describe Api::V1::TopicsController, type: :controller do
  describe "#trending" do
    before do
      FactoryGirl.create_list(:tag_name_topic, 8, target_date: Date.yesterday)
      FactoryGirl.create_list(:tag_name_topic, 10)
    end

    it "returns a collection of 8 the trending topics for today" do
      get :trending, format: :json

      expect(response).to be_success
      expect(json['topics'].count).to eq(8)
    end

    it "validates the response has the correct schema" do
      get :trending, format: :json

      expect(response).to be_success
      expect(response).to match_response_schema("topic")
    end
  end
end
