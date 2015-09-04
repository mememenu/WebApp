require 'rails_helper'

describe Event, type: :model do
  subject { FactoryGirl.build(:event) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:starts_at) }
  it { should validate_presence_of(:ends_at) }
  it { should validate_presence_of(:place) }

  context "name uniqueness scoped to place" do
    it "is invalid if another event with the same name exists for that place" do
      place = FactoryGirl.create(:place)
      FactoryGirl.create(:event, name: 'dummy event', place: place)
      invalid_event = FactoryGirl.build(:event,
                                        name: 'dummy event',
                                        place: place)

      expect(invalid_event).not_to be_valid
      error_msg = "has already been taken"
      expect(invalid_event.errors[:name].first).to eq(error_msg)
    end

    it "is valid if the event name exists for a different place" do
      FactoryGirl.create(:event, name: 'dummy event')
      valid_event = FactoryGirl.build(:place, name: 'dummy event')

      expect(valid_event).to be_valid
    end

    it "is valid if the name does not exists in any city" do
      valid_event = FactoryGirl.build(:event, name: 'dummy place')

      expect(valid_event).to be_valid
    end
  end
end
