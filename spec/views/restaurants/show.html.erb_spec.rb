require 'rails_helper'

RSpec.describe "restaurants/show", :type => :view do
  before(:each) do
    @restaurant = assign(:restaurant, Restaurant.create!(
      :name => "Name",
      :address_1 => "Address 1",
      :address_2 => "Address 2",
      :city => "City",
      :state => "State",
      :zipcode => "Zipcode",
      :description => "MyText",
      :phone => "Phone",
      :dollars => 1,
      :reservations => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address 1/)
    expect(rendered).to match(/Address 2/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Zipcode/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/false/)
  end
end
