require 'rails_helper'

RSpec.describe IngredientsController, :type => :controller do
  before do
    sign_in FactoryGirl.create(:admin)
  end

  let!(:ingredient) { FactoryGirl.create(:ingredient) }
  let(:valid_attributes) {
    { name: 'Name', dish_id: ingredient.dish_id, restaurant_id: ingredient.restaurant_id}
  }

  let(:invalid_attributes) {
    { name: '' }
  }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all ingredients as @ingredients" do
      get :index, {}, valid_session
      expect(assigns(:ingredients)).to eq([ingredient])
    end
  end

  describe "GET show" do
    it "assigns the requested ingredient as @ingredient" do
      get :show, {:id => ingredient.to_param}, valid_session
      expect(assigns(:ingredient)).to eq(ingredient)
    end
  end

  describe "GET new" do
    it "assigns a new ingredient as @ingredient" do
      get :new, {}, valid_session
      expect(assigns(:ingredient)).to be_a_new(Ingredient)
    end
  end

  describe "GET edit" do
    it "assigns the requested ingredient as @ingredient" do
      get :edit, {:id => ingredient.to_param}, valid_session
      expect(assigns(:ingredient)).to eq(ingredient)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Ingredient" do
        expect {
          post :create, {:ingredient => valid_attributes}, valid_session
        }.to change(Ingredient, :count).by(1)
      end

      it "assigns a newly created ingredient as @ingredient" do
        post :create, {:ingredient => valid_attributes}, valid_session
        expect(assigns(:ingredient)).to be_a(Ingredient)
        expect(assigns(:ingredient)).to be_persisted
      end

      it "redirects to the created ingredient" do
        post :create, {:ingredient => valid_attributes}, valid_session
        expect(response).to redirect_to(Ingredient.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved ingredient as @ingredient" do
        post :create, {:ingredient => invalid_attributes}, valid_session
        expect(assigns(:ingredient)).to be_a_new(Ingredient)
      end

      it "re-renders the 'new' template" do
        post :create, {:ingredient => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        { name: 'New Ingredient' }
      }

      it "updates the requested ingredient" do
        put :update, {:id => ingredient.to_param, :ingredient => new_attributes}, valid_session
        ingredient.reload
        expect(ingredient.name).to eq('New Ingredient')
      end

      it "assigns the requested ingredient as @ingredient" do
        put :update, {:id => ingredient.to_param, :ingredient => valid_attributes}, valid_session
        expect(assigns(:ingredient)).to eq(ingredient)
      end

      it "redirects to the ingredient" do
        put :update, {:id => ingredient.to_param, :ingredient => valid_attributes}, valid_session
        expect(response).to redirect_to(ingredient)
      end
    end

    describe "with invalid params" do
      it "assigns the ingredient as @ingredient" do
        put :update, {:id => ingredient.to_param, :ingredient => invalid_attributes}, valid_session
        expect(assigns(:ingredient)).to eq(ingredient)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => ingredient.to_param, :ingredient => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested ingredient" do
      expect {
        delete :destroy, {:id => ingredient.to_param}, valid_session
      }.to change(Ingredient, :count).by(-1)
    end

    it "redirects to the ingredients list" do
      delete :destroy, {:id => ingredient.to_param}, valid_session
      expect(response).to redirect_to(ingredient.dish.restaurant)
    end
  end

end
