require 'rails_helper'

RSpec.describe "contacts/show", :type => :view do
  before(:each) do
    @contact = assign(:contact, Contact.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :favorite_restaurant => "Favorite Restaurant",
      :email => "Email",
      :message => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Favorite Restaurant/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/MyText/)
  end
end
