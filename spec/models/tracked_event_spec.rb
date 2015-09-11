require 'rails_helper'

describe TrackedEvent, type: :model do
  it { should validate_presence_of(:kind) }
  it { should validate_inclusion_of(:kind).in_array(%w(Visit ResourceDetailView TopicView)) }

  it "validates that name is present if the event's kind is TopicView" do
    event = FactoryGirl.build(:topic_view_event)
    event.name = nil

    expect(event).not_to be_valid
    expect(event.errors.messages[:name]).to include("can't be blank")
  end
end
