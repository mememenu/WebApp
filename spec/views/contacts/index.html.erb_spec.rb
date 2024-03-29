require 'rails_helper'

RSpec.describe "contacts/index", :type => :view do
  before(:each) do
    assign(:contacts, [
      Contact.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :favorite_restaurant => "Favorite Restaurant",
        :email => "Email",
        :message => "MyText"
      ),
      Contact.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :favorite_restaurant => "Favorite Restaurant",
        :email => "Email",
        :message => "MyText"
      )
    ])
  end

  it "renders a list of contacts" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Favorite Restaurant".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
