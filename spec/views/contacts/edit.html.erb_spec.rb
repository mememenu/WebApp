require 'rails_helper'

RSpec.describe "contacts/edit", :type => :view do
  before(:each) do
    @contact = assign(:contact, Contact.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :favorite_restaurant => "MyString",
      :email => "MyString",
      :message => "MyText"
    ))
  end

  it "renders the edit contact form" do
    render

    assert_select "form[action=?][method=?]", contact_path(@contact), "post" do

      assert_select "input#contact_first_name[name=?]", "contact[first_name]"

      assert_select "input#contact_last_name[name=?]", "contact[last_name]"

      assert_select "input#contact_favorite_restaurant[name=?]", "contact[favorite_restaurant]"

      assert_select "input#contact_email[name=?]", "contact[email]"

      assert_select "textarea#contact_message[name=?]", "contact[message]"
    end
  end
end
