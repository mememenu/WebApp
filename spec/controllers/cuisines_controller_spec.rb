require 'rails_helper'

RSpec.describe CuisinesController, :type => :controller do
  before do
    sign_in FactoryGirl.create(:admin)
  end

  let!(:cuisine) { Cuisine.create!(genre: 'Uruguayan') }

  let(:valid_attributes) { { genre: 'Italian' }  }

  let(:invalid_attributes) { { genre: '' } }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all cuisines as @cuisines" do
      get :index, {}, valid_session
      expect(assigns(:cuisines)).to eq([cuisine])
    end
  end

  describe "GET show" do
    it "assigns the requested cuisine as @cuisine" do
      get :show, {:id => cuisine.to_param}, valid_session
      expect(assigns(:cuisine)).to eq(cuisine)
    end
  end

  describe "GET new" do
    it "assigns a new cuisine as @cuisine" do
      get :new, {}, valid_session
      expect(assigns(:cuisine)).to be_a_new(Cuisine)
    end
  end

  describe "GET edit" do
    it "assigns the requested cuisine as @cuisine" do
      get :edit, {:id => cuisine.to_param}, valid_session
      expect(assigns(:cuisine)).to eq(cuisine)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Cuisine" do
        expect {
          post :create, {:cuisine => valid_attributes}, valid_session
        }.to change(Cuisine, :count).by(1)
      end

      it "assigns a newly created cuisine as @cuisine" do
        post :create, {:cuisine => valid_attributes}, valid_session
        expect(assigns(:cuisine)).to be_a(Cuisine)
        expect(assigns(:cuisine)).to be_persisted
      end

      it "redirects to the created cuisine" do
        post :create, {:cuisine => valid_attributes}, valid_session
        expect(response).to redirect_to(Cuisine.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved cuisine as @cuisine" do
        post :create, {:cuisine => invalid_attributes}, valid_session
        expect(assigns(:cuisine)).to be_a_new(Cuisine)
      end

      it "re-renders the 'new' template" do
        post :create, {:cuisine => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) { { genre: 'Italian' } }

      it "updates the requested cuisine" do
        put :update, {:id => cuisine.to_param, :cuisine => new_attributes}, valid_session
        cuisine.reload
        expect(cuisine.genre).to eq('Italian')
      end

      it "assigns the requested cuisine as @cuisine" do
        put :update, {:id => cuisine.to_param, :cuisine => valid_attributes}, valid_session
        expect(assigns(:cuisine)).to eq(cuisine)
      end

      it "redirects to the cuisine" do
        put :update, {:id => cuisine.to_param, :cuisine => valid_attributes}, valid_session
        expect(response).to redirect_to(cuisine)
      end
    end

    describe "with invalid params" do
      it "assigns the cuisine as @cuisine" do
        put :update, {:id => cuisine.to_param, :cuisine => invalid_attributes}, valid_session
        expect(assigns(:cuisine)).to eq(cuisine)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => cuisine.to_param, :cuisine => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested cuisine" do
      expect {
        delete :destroy, {:id => cuisine.to_param}, valid_session
      }.to change(Cuisine, :count).by(-1)
    end

    it "redirects to the cuisines list" do
      delete :destroy, {:id => cuisine.to_param}, valid_session
      expect(response).to redirect_to(cuisines_url)
    end
  end

end
