require 'rails_helper'

RSpec.describe "images/edit", :type => :view do
  before(:each) do
    @image = assign(:image, Image.create!(
      :dish => nil
    ))
  end

  it "renders the edit image form" do
    render

    assert_select "form[action=?][method=?]", image_path(@image), "post" do

      assert_select "input#image_dish_id[name=?]", "image[dish_id]"
    end
  end
end
