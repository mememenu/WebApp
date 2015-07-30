require 'rails_helper'


RSpec.describe PlacesController, :type => :controller do
  before do
    sign_in FactoryGirl.create(:admin)
  end

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:place)
  }

  let(:invalid_attributes) do
    attrs = FactoryGirl.attributes_for(:place)
    attrs[:state] = 'MND'
    attrs
  end

  let(:valid_session) { {} }

  describe "validate_place_owner_or_admin filter" do
    subject do
      put :update,
        { id: place.to_param, place: new_attributes },
        valid_session
    end
    let(:place) { FactoryGirl.create(:place) }
    let(:new_attributes) do
      { banner_attributes: { avatar: fixture_file_upload('/images/896x1052.jpeg', 'image/jpeg') } }
    end

    it "redirects to root_path if user is not the place owner nor admin" do
      sign_in FactoryGirl.create(:user)

      expect(subject).to redirect_to(root_path)
    end

    it "lets you go through if user is place owner" do
      user = FactoryGirl.create(:user)
      place.update_column(:owner_id, user.id)
      sign_in user

      expect(subject).not_to redirect_to root_path
    end

    it "lets you go through if user is an admin" do
      sign_in FactoryGirl.create(:admin)

      expect(subject).not_to redirect_to root_path
    end
  end

  describe "GET index" do
    it "assigns all places as @places" do
      place = Place.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:places)).to eq([place])
    end
  end

  describe "GET show" do
    it "assigns the requested place as @place" do
      place = Place.create! valid_attributes
      get :show, {:id => place.to_param}, valid_session
      expect(assigns(:place)).to eq(place)
    end
  end

  describe "GET new" do
    it "assigns a new place as @place" do
      get :new, {}, valid_session
      expect(assigns(:place)).to be_a_new(Place)
    end
  end

  describe "GET edit" do
    it "assigns the requested place as @place" do
      place = Place.create! valid_attributes
      get :edit, {:id => place.to_param}, valid_session
      expect(assigns(:place)).to eq(place)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new place" do
        expect {
          post :create, {:place => valid_attributes}, valid_session
        }.to change(Place, :count).by(1)
      end

      it "assigns a newly created place as @place" do
        post :create, {:place => valid_attributes}, valid_session
        expect(assigns(:place)).to be_a(Place)
        expect(assigns(:place)).to be_persisted
      end

      it "redirects to the created place" do
        post :create, {:place => valid_attributes}, valid_session
        expect(response).to redirect_to(Place.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved place as @place" do
        post :create, {:place => invalid_attributes}, valid_session
        expect(assigns(:place)).to be_a_new(Place)
      end

      it "re-renders the 'new' template" do
        post :create, {:place => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) do
        { banner_attributes: { avatar: fixture_file_upload('/images/896x1052.jpeg', 'image/jpeg') } }
      end

      it "updates the requested place" do
        place = Place.create! valid_attributes
        put :update, {:id => place.to_param, :place => new_attributes}, valid_session
        place.reload
        expect(assigns[:place].banner).not_to be_nil
        expect(flash[:notice]).to eq('Place was successfully updated.')
      end

      it "assigns the requested place as @place" do
        place = Place.create! valid_attributes
        put :update, {:id => place.to_param, :place => valid_attributes}, valid_session
        expect(assigns(:place)).to eq(place)
      end

      it "redirects to the place" do
        place = Place.create! valid_attributes
        put :update, {:id => place.to_param, :place => valid_attributes}, valid_session
        expect(response).to redirect_to(place)
      end
    end

    describe "with invalid params" do
      it "assigns the place as @place" do
        place = Place.create! valid_attributes
        put :update, {:id => place.to_param, :place => invalid_attributes}, valid_session
        expect(assigns(:place)).to eq(place)
      end

      it "re-renders the 'edit' template" do
        place = Place.create! valid_attributes
        put :update, {:id => place.to_param, :place => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested place" do
      place = Place.create! valid_attributes
      expect {
        delete :destroy, {:id => place.to_param}, valid_session
      }.to change(Place, :count).by(-1)
    end

    it "redirects to the places list" do
      place = Place.create! valid_attributes
      delete :destroy, {:id => place.to_param}, valid_session
      expect(response).to redirect_to(places_url)
    end
  end

end
