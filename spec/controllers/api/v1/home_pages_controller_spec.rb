require "rails_helper"

describe Api::V1::HomePagesController, type: :controller do
  it "validates the response has the correct schema" do
    FactoryGirl.create(:home_page)
    get :index, format: :json

    expect(response).to be_success
    expect(response).to match_response_schema("home_page")
  end
end
