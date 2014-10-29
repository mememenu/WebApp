require 'rails_helper'

RSpec.describe User, :type => :model do

  it "should save a user upon successful registration" do 
    expect(User.count).to eq(0)
    user = User.new
    user.email = "alfonsopintos@gmail.com"
    user.password = "12345678"
    user.password_confirmation = "12345678"
    user.save
    expect(User.count).to eq(1)
  end
end
