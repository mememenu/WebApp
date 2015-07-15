require 'rails_helper'

RSpec.describe Dish, type: :model do
  let(:dish) { FactoryGirl.create(:dish) }
  let(:category) { dish.category }

  it { should validate_presence_of(:category_id) }
  it { should validate_presence_of(:menu_id) }
  it { should validate_presence_of(:restaurant_id) }

  it "should be destroyed when its category is destroyed" do
    category.destroy

    expect(Category.count).to eq(0)
    expect(Dish.count).to eq(0)
  end

  it "should become hidden when corresponding category becomes hidden" do
    dish.update_attributes(hide: false)
    category.update_attributes(hide: true)

    expect(dish.reload.hide).to be_truthy
  end

  it "should become unhidden when corresponding category becomes unhidden" do
    dish.update_attributes(hide: true)
    category.update_attributes(hide: false)

    expect(dish.reload.hide).to be_falsy
  end

  describe 'validations' do
    describe 'Validate image dimension' do
      it 'is invalid if the image is smaller than 648x648' do
        invalid_pic = fixture_file_upload('/images/430x505.jpeg', 'image/jpeg')
        dish = FactoryGirl.build(:dish, default_image_attributes: { avatar: invalid_pic })

        expect(dish).not_to be_valid
        expect(dish.errors["default_image.avatar_dimension"]).to eq(['is too small.'])
      end

      it 'is valid if the image is bigger than 648x648' do
        dish_with_avatar = FactoryGirl.build(:dish, :with_avatar)

        expect(dish_with_avatar).to be_valid
      end
    end
  end
end
