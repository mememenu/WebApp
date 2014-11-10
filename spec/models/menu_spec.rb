require 'rails_helper'

RSpec.describe Menu, :type => :model do
  

  it "should save successfully when all information present" do
    @menu = Menu.new
    @menu.name = "Lunch"
    @menu.save
  end

end
