require 'rails_helper'


RSpec.describe MenusController, :type => :controller do
  before do
    sign_in FactoryGirl.create(:admin)
  end

  let!(:menu) { FactoryGirl.create(:menu) }
  let(:valid_attributes) {
    FactoryGirl.attributes_for(:menu).merge(restaurant_id: menu.restaurant_id)
  }

  let(:invalid_attributes) {
    { name: '' }
  }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all menus as @menus" do
      get :index, {}, valid_session
      expect(assigns(:menus)).to eq([menu])
    end
  end

  describe "GET show" do
    it "assigns the requested menu as @menu" do
      get :show, {:id => menu.to_param}, valid_session
      expect(assigns(:menu)).to eq(menu)
    end
  end

  describe "GET new" do
    it "assigns a new menu as @menu" do
      get :new, {}, valid_session
      expect(assigns(:menu)).to be_a_new(Menu)
    end
  end

  describe "GET edit" do
    it "assigns the requested menu as @menu" do
      get :edit, {:id => menu.to_param}, valid_session
      expect(assigns(:menu)).to eq(menu)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Menu" do
        expect {
          post :create, {:menu => valid_attributes}, valid_session
        }.to change(Menu, :count).by(1)
      end

      it "assigns a newly created menu as @menu" do
        post :create, {:menu => valid_attributes}, valid_session
        expect(assigns(:menu)).to be_a(Menu)
        expect(assigns(:menu)).to be_persisted
      end

      it "redirects to the created menu" do
        post :create, {:menu => valid_attributes}, valid_session
        expect(response).to redirect_to(menu.restaurant)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved menu as @menu" do
        post :create, {:menu => invalid_attributes}, valid_session
        expect(assigns(:menu)).to be_a_new(Menu)
      end

      it "re-renders the 'new' template" do
        post :create, {:menu => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        { name: 'updated menu' }
      }

      it "updates the requested menu" do
        put :update, {:id => menu.to_param, :menu => new_attributes}, valid_session
        menu.reload
        expect(menu.name).to eq('updated menu')
      end

      it "assigns the requested menu as @menu" do
        put :update, {:id => menu.to_param, :menu => valid_attributes}, valid_session
        expect(assigns(:menu)).to eq(menu)
      end

      it "redirects to the restaurant" do
        put :update, {:id => menu.to_param, :menu => valid_attributes}, valid_session
        expect(response).to redirect_to(menu.restaurant)
      end
    end

    describe "with invalid params" do
      it "assigns the menu as @menu" do
        put :update, {:id => menu.to_param, :menu => invalid_attributes}, valid_session
        expect(assigns(:menu)).to eq(menu)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => menu.to_param, :menu => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested menu" do
      expect {
        delete :destroy, {:id => menu.to_param}, valid_session
      }.to change(Menu, :count).by(-1)
    end

    it "redirects to the restaurant" do
      delete :destroy, {:id => menu.to_param}, valid_session
      expect(response).to redirect_to(menu.restaurant)
    end
  end

end
