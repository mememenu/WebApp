require 'rails_helper'

describe TrackedEvent, type: :model do
  it { should validate_presence_of(:kind) }
  it { should validate_inclusion_of(:kind).in_array(%w(Visit ResourceDetailView TopicView)) }
end
