require "rails_helper"

describe Api::V1::ListsController, type: :controller do
  it "validates the response has the correct schema" do
    FactoryGirl.create(:generic_list, :with_places)
    get :index, format: :json

    expect(response).to be_success
    expect(response).to match_response_schema("list")
  end

  it "returns only generic lists by default" do
    list = FactoryGirl.create(:generic_list)
    FactoryGirl.create(:featured_list)
    get :index, format: :json

    expect(json["lists"].count).to eq(1)
    expect(json["lists"].first["id"]).to eq(list.id)
  end

  it "returns lists from the specified list kind" do
    FactoryGirl.create(:generic_list)
    list = FactoryGirl.create(:featured_list)
    get :index, format: :json, kind: "FeaturedList"

    expect(json["lists"].count).to eq(1)
    expect(json["lists"].first["id"]).to eq(list.id)
  end

  it "respects the limit if specified" do
    FactoryGirl.create_list(:generic_list, 2)
    get :index, format: :json, limit: 1

    expect(json["lists"].count).to eq(1)
  end
end
