require 'rails_helper'

RSpec.describe User, type: :model do
  it "does not save a user if the password is less that 8 characters" do
    user = FactoryGirl.build(:user, password: '123')
    expect(user).not_to be_valid
  end

  it "does not save a user if the email is already taken" do
    user = FactoryGirl.create(:user)
    duplicated_user = FactoryGirl.build(:user, email: user.email)

    expect(duplicated_user).not_to be_valid
  end

  it "does not save a user if the email is not valid" do
    user = FactoryGirl.build(:user, email: "alfonsopintosgmail.com")
    expect(user).not_to be_valid
  end

  describe "#from_omniauth" do
    it "creates the user and sets the email if it does not exist" do
      auth = double("Auth", provider: "facebook", uid: "1234",
                            info: double("Info", email: "test@test.example"))
      result = User.from_omniauth(auth)

      expect(result.provider).to eq("facebook")
      expect(result.uid).to eq("1234")
      expect(result.email).to eq("test@test.example")
    end

    it "returns the found user if it finds one for the provider/uid pair" do
      user = FactoryGirl.create(:user, provider: "facebook", uid: "1234")

      auth = double("Auth", provider: "facebook", uid: "1234",
                            info: double("Info", email: "test@test.example"))
      result = User.from_omniauth(auth)

      expect(result).to eq(user)
    end
  end
end
