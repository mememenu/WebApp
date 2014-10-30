require 'rails_helper'

RSpec.describe "menus/show", :type => :view do
  before(:each) do
    @menu = assign(:menu, Menu.create!(
      :name => "Name",
      :display_name => "Display Name",
      :description => "MyText",
      :restaurant => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Display Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
