require 'rails_helper'

RSpec.describe Cuisine, :type => :model do
  
  it "should save if genre presence is true" do
    expect(Cuisine.count).to eq(0)
    cui = Cuisine.new
    cui.genre = "Italian"
    cui.save
    expect(Cuisine.count).to eq(1)
  end

  it "should not save if genre presence is not true" do
    expect(Cuisine.count).to eq(0)
    cui = Cuisine.new
    cui.genre = nil
    cui.save
    expect(Cuisine.count).to eq(0)
    expect { raise StandardError }.to raise_error
  end
end
