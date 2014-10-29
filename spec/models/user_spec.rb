require 'rails_helper'

  def new_user
    user = User.new
    user.email = "alfonsopintos@gmail.com"
    user.password = "12345678"
    user.password_confirmation = "12345678"
    user.save
  end

RSpec.describe User, :type => :model do

  it "should save a user upon successful registration" do 
    expect(User.count).to eq(0)
    new_user
    expect(User.count).to eq(1)
  end

  it "should not save a user if the password is less that 8 characters" do 
    expect(User.count).to eq(0)
    user = User.new
    user.email = "alfonsopintos@gmail.com"
    user.password = "1234567"
    user.password_confirmation = "1234567"
    user.save
    expect(User.count).to eq(0)
  end

    it "should not save a user if the email is already taken" do 
    expect(User.count).to eq(0)
    new_user
    expect(User.count).to eq(1)
    duplicate_user = User.new
    duplicate_user.email = "alfonsopintos@gmail.com"
    duplicate_user.password = "12345678"
    duplicate_user.password_confirmation = "12345678"
    duplicate_user.save
    expect(User.count).to eq(1)
  end

  it "should not save a user if the email is not valid" do 
    expect(User.count).to eq(0)
    user = User.new
    user.email = "alfonsopintosgmail.com"
    user.password = "12345678"
    user.password_confirmation = "12345678"
    user.save
    expect(User.count).to eq(0)
  end    

end
