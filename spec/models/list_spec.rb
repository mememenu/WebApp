require 'rails_helper'

describe List, type: :model do
  it { should validate_presence_of(:name) }

  it "sets the default name if user is present" do
    list = FactoryGirl.create(:user_list)

    expect(list.name).to eq("My List")
  end
end
