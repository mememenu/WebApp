require 'rails_helper'

describe Api::V1::UsersController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }

  before do
    allow_token_for_user(user)
  end

  describe '#list' do
    it "returns current user default list" do
      get :list, format: :json, id: user.id

      expect(response).to be_success
      expect(json['list']['id']).to eq(user.default_list.id)
    end
  end

  describe '#lists' do
    before do
      user.other_lists << FactoryGirl.create_list(:user_list, 2)
    end

    it "returns current user lists" do
      get :lists, format: :json, id: user.id

      expect(response).to be_success
      expect(json.count).to eq(2)
    end
  end
end
