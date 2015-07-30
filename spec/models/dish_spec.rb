require 'rails_helper'

RSpec.describe Dish, type: :model do
  let(:dish) { FactoryGirl.create(:dish) }
  let(:category) { dish.category }

  it { should validate_presence_of(:category_id) }
  it { should validate_presence_of(:menu_id) }
  it { should validate_presence_of(:place_id) }

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
        dish_with_avatar = FactoryGirl.build(:dish, :with_default_image)

        expect(dish_with_avatar).to be_valid
      end
    end
  end

  context 'with default image and additional images' do
    let(:dish) { FactoryGirl.create(:dish, :with_default_image,
                                           :with_additional_images) }
    it "has one default image" do
      expect(dish.default_image.avatar.present?).to be
    end

    it "has two additional images" do
      expect(dish.additional_images.count).to eq(2)
      expect(dish.additional_images.first.avatar.present?).to be
      expect(dish.additional_images.last.avatar.present?).to be
    end

    it "does not include default image among additional ones" do
      expect(dish.additional_images).not_to include(dish.default_image)
    end
  end
end
