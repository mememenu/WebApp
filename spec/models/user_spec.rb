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
end
