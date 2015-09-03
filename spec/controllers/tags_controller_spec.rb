require 'rails_helper'

describe TagsController, type: :controller do
  let(:tag) { FactoryGirl.create(:tag) }
  let(:place) { FactoryGirl.create(:place) }

  describe "#add_to_place" do
    it "adds the tag to the place" do
      put :add_to_place, id: tag.id, place_id: place.id

      place.reload
      expect(response).to be_success
      expect(place.tags).to include(tag)
    end

    it "fails if the place does not exists" do
      put :add_to_place, id: tag.id, place_id: place.id + 1

      expect(response).not_to be_success
    end

    it "fails if the tag does not exists" do
      put :add_to_place, id: tag.id + 1, place_id: place.id

      expect(response).not_to be_success
    end
  end

  describe "#remove_from_place" do
    it "removes the tag from the place" do
      place.tags << tag
      expect(place.tags).to include(tag)

      put :remove_from_place, id: tag.id, place_id: place.id

      place.reload
      expect(response).to be_success
      expect(place.tags).not_to include(tag)
    end

    it "fails if the place does not exists" do
      put :remove_from_place, id: tag.id, place_id: place.id + 1

      expect(response).not_to be_success
    end

    it "fails if the tag does not exists" do
      put :remove_from_place, id: tag.id + 1, place_id: place.id

      expect(response).not_to be_success
    end
  end

  describe "#create" do
    it "creates a tag with that name" do
      post :create, name: "test tag"

      expect(response).to be_success
      expect(Tag.find_by_name("test tag")).to be
    end

   it "creates a tag and adds it to the specified place" do
     post :create, name: "test tag", place_id: place.id

     expect(response).to be_success
     tag = Tag.find_by_name("test tag")
     expect(tag).to be
     expect(place.reload.tags).to include(tag)
   end

   it "fails if no name provided" do
     post :create

     expect(response).not_to be_success
   end

   it "returns errors if it is not valid" do
     FactoryGirl.create(:tag, name: "test tag")

     post :create, name: "test tag"

     expect(response).to be_success
     expect(JSON.parse(response.body)['errors']['name']).to include("has already been taken")
   end
  end
end
