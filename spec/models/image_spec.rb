require 'rails_helper'

RSpec.describe Image, :type => :model do
  
  before :each do 
    @restaurant = Restaurant.create!(name: "Mmmm", address_1: "123 fake lane", address_2: "apartment 4", city: "Miami", state: "FL", zipcode: "33132", phone: "1234567890", description: "tasty food", dollars: 2, reservations: true)
    @menu = Menu.create!(name: "Lunch", restaurant_id: @restaurant.id)
    @category = Category.create!(name: 'Appetizer', menu_id: @menu.id)
    @dish = Dish.create!(name: "pork belly", category_id: @category.id, portion_size: 'full', spice: 3)
  end


  def create_image
    expect(Image.count).to eq(0)
    @image = Image.new
    @image.dish_id = @dish.id
    @image.save
    expect(Image.count).to eq(1)
  end

  it "should save succesfully if dish_id is present" do
    create_image
  end

  it "should be destroyed if correspnding dish is destroyed" do 
    create_image

    @dish.destroy
    expect(Dish.count).to eq(0)
    expect(Image.count).to eq(0)
  end

  it "should be destroyed if correspnding restaurant is destroyed" do
    create_image

    @restaurant.destroy
    expect(Restaurant.count).to eq(0)
    expect(Image.count).to eq(0)
  end

  it "should become hidden if correspnding dish becomes hidden" do
    create_image

    @dish.hide = true
    @dish.save
    @dish.reload

    @image.reload
    expect(@image.hide).to eq(@dish.hide)
  end

  it "should become unhidden is correspnding dish becomes unhidden" do
    create_image

    @dish.hide = true
    @dish.save
    @dish.reload

    @image.reload
    expect(@image.hide).to eq(@dish.hide)

    @dish.hide = false
    @dish.save
    @dish.reload

    @image.reload
    expect(@image.hide).to eq(@dish.hide)
  end

  it "should become hidden if correspnding restaurant becomes hidden" do 
    create_image

    @restaurant.hide = true
    @restaurant.save
    @restaurant.reload

    @image.reload
    expect(@image.hide).to eq(@restaurant.hide)
  end




end
