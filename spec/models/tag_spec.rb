require 'rails_helper'

describe Tag, type: :model do
  it { should validate_presence_of(:name) }

  context "name uniqueness" do
    it "is invalid if there is other one with the same name" do
      tag = FactoryGirl.create(:tag)

      expect(FactoryGirl.build(:tag, name: tag.name)).not_to be_valid
    end

    it "is valid if there is no other with the same name" do
      expect(FactoryGirl.build(:tag, name: "Test tag")).to be_valid
    end

    it "validaes uniqueness in a case insensitive way" do
      FactoryGirl.create(:tag, name: "pizza")

      expect(FactoryGirl.build(:tag, name: "Pizza")).not_to be_valid
    end
  end
end
