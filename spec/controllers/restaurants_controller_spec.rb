require 'rails_helper'


RSpec.describe RestaurantsController, :type => :controller do
  before do
    sign_in FactoryGirl.create(:admin)
  end

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:restaurant)
  }

  let(:invalid_attributes) do
    attrs = FactoryGirl.attributes_for(:restaurant)
    attrs[:state] = 'MND'
    attrs
  end

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all restaurants as @restaurants" do
      restaurant = Restaurant.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:restaurants)).to eq([restaurant])
    end
  end

  describe "GET show" do
    it "assigns the requested restaurant as @restaurant" do
      restaurant = Restaurant.create! valid_attributes
      get :show, {:id => restaurant.to_param}, valid_session
      expect(assigns(:restaurant)).to eq(restaurant)
    end
  end

  describe "GET new" do
    it "assigns a new restaurant as @restaurant" do
      get :new, {}, valid_session
      expect(assigns(:restaurant)).to be_a_new(Restaurant)
    end
  end

  describe "GET edit" do
    it "assigns the requested restaurant as @restaurant" do
      restaurant = Restaurant.create! valid_attributes
      get :edit, {:id => restaurant.to_param}, valid_session
      expect(assigns(:restaurant)).to eq(restaurant)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Restaurant" do
        expect {
          post :create, {:restaurant => valid_attributes}, valid_session
        }.to change(Restaurant, :count).by(1)
      end

      it "assigns a newly created restaurant as @restaurant" do
        post :create, {:restaurant => valid_attributes}, valid_session
        expect(assigns(:restaurant)).to be_a(Restaurant)
        expect(assigns(:restaurant)).to be_persisted
      end

      it "redirects to the created restaurant" do
        post :create, {:restaurant => valid_attributes}, valid_session
        expect(response).to redirect_to(Restaurant.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved restaurant as @restaurant" do
        post :create, {:restaurant => invalid_attributes}, valid_session
        expect(assigns(:restaurant)).to be_a_new(Restaurant)
      end

      it "re-renders the 'new' template" do
        post :create, {:restaurant => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) do
        { restaurant_banner_attributes: { avatar: fixture_file_upload('/images/896x1052.jpeg', 'image/jpeg') } }
      end

      it "updates the requested restaurant" do
        restaurant = Restaurant.create! valid_attributes
        put :update, {:id => restaurant.to_param, :restaurant => new_attributes}, valid_session
        restaurant.reload
        expect(assigns[:restaurant].restaurant_banner).not_to be_nil
        expect(flash[:notice]).to eq('Restaurant was successfully updated.')
      end

      it "assigns the requested restaurant as @restaurant" do
        restaurant = Restaurant.create! valid_attributes
        put :update, {:id => restaurant.to_param, :restaurant => valid_attributes}, valid_session
        expect(assigns(:restaurant)).to eq(restaurant)
      end

      it "redirects to the restaurant" do
        restaurant = Restaurant.create! valid_attributes
        put :update, {:id => restaurant.to_param, :restaurant => valid_attributes}, valid_session
        expect(response).to redirect_to(restaurant)
      end
    end

    describe "with invalid params" do
      it "assigns the restaurant as @restaurant" do
        restaurant = Restaurant.create! valid_attributes
        put :update, {:id => restaurant.to_param, :restaurant => invalid_attributes}, valid_session
        expect(assigns(:restaurant)).to eq(restaurant)
      end

      it "re-renders the 'edit' template" do
        restaurant = Restaurant.create! valid_attributes
        put :update, {:id => restaurant.to_param, :restaurant => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested restaurant" do
      restaurant = Restaurant.create! valid_attributes
      expect {
        delete :destroy, {:id => restaurant.to_param}, valid_session
      }.to change(Restaurant, :count).by(-1)
    end

    it "redirects to the restaurants list" do
      restaurant = Restaurant.create! valid_attributes
      delete :destroy, {:id => restaurant.to_param}, valid_session
      expect(response).to redirect_to(restaurants_url)
    end
  end

end
