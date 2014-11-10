require 'rails_helper'

RSpec.describe Category, :type => :model do

  before :each do 
    @menu = Menu.create(name: "Lunch")
  end

  it "should save succesfully with name and menu_id" do
    expect(Category.count).to eq(0)
    @category = Category.new
    @category.name = "Appetizer"
    @category.menu_id = @menu.id
    @category.save
    expect(Category.count).to eq(1)
  end

  it "should not save if name is not present" do 
    expect(Category.count).to eq(0)
    @category = Category.new
    @category.menu_id = @menu.id
    @category.save
    expect(Category.count).to eq(0)
  end

  it "should not save if menu_id is not present" do
    expect(Category.count).to eq(0)
    @category = Category.new
    @category.name = "Appetizer"
    @category.save
    expect(Category.count).to eq(0)
  end

end
