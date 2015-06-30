require 'rails_helper'

RSpec.describe "categories/new", :type => :view do
  it "renders new category form" do
    assign(:category, FactoryGirl.create(:category))
    render

    expect(view).to render_template(partial: '_form')
  end
end
