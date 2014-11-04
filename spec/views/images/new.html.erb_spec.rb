require 'rails_helper'

RSpec.describe "images/new", :type => :view do
  before(:each) do
    assign(:image, Image.new(
      :dish => nil
    ))
  end

  it "renders new image form" do
    render

    assert_select "form[action=?][method=?]", images_path, "post" do

      assert_select "input#image_dish_id[name=?]", "image[dish_id]"
    end
  end
end
