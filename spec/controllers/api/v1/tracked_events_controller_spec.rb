require 'rails_helper'

describe Api::V1::TrackedEventsController, type: :controller do
  describe "#create" do
    it "creates the visit event correctly" do
      expect {
        post :create, format: :json,
                      tracked_event: FactoryGirl.attributes_for(:visit_event)
      }.to change { TrackedEvent.count }.by(1)

      expect(response).to be_success
    end

    it "creates the resource detail view event correctly" do
      expect {
        post :create, format: :json,
                      tracked_event: FactoryGirl.attributes_for(:resource_detail_view_event,
                                                                :for_place)
      }.to change { TrackedEvent.count }.by(1)

      expect(response).to be_success
    end

    it "returns an error if the event was not created" do
      expect {
        post :create, format: :json, tracked_event: { eventable_id: 1234 }
      }.to change { TrackedEvent.count }.by(0)

      expect(response).to be_success
    end
  end
end
