require 'rails_helper'


RSpec.describe CategoriesController, :type => :controller do
  before do
    sign_in FactoryGirl.create(:admin)
  end

  let(:menu) { FactoryGirl.create(:menu) }
  let!(:category) { FactoryGirl.create(:category, menu: menu, restaurant: menu.restaurant) }

  let(:valid_attributes) do
    { name: 'Test Category', priority: 4, menu_id: menu.id, restaurant_id: menu.restaurant_id }
  end

  let(:invalid_attributes) do
    { name: '', priority: 4, menu_id: menu.id, restaurant_id: menu.restaurant_id }
  end

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all categories as @categories" do
      get :index, {}, valid_session
      expect(assigns(:categories)).to eq([category])
    end
  end

  describe "GET show" do
    it "assigns the requested category as @category" do
      get :show, {:id => category.to_param}, valid_session
      expect(assigns(:category)).to eq(category)
    end
  end

  describe "GET new" do
    it "assigns a new category as @category" do
      get :new, {}, valid_session
      expect(assigns(:category)).to be_a_new(Category)
    end
  end

  describe "GET edit" do
    it "assigns the requested category as @category" do
      get :edit, {:id => category.to_param}, valid_session
      expect(assigns(:category)).to eq(category)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Category" do
        expect {
          post :create, {:category => valid_attributes}, valid_session
        }.to change(Category, :count).by(1)
      end

      it "assigns a newly created category as @category" do
        post :create, {:category => valid_attributes}, valid_session
        expect(assigns(:category)).to be_a(Category)
        expect(assigns(:category)).to be_persisted
      end

      it "redirects to the created category" do
        post :create, {:category => valid_attributes}, valid_session
        expect(response).to redirect_to(assigns[:category].restaurant)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved category as @category" do
        post :create, {:category => invalid_attributes}, valid_session
        expect(assigns(:category)).to be_a_new(Category)
      end

      it "re-renders the 'new' template" do
        post :create, {:category => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) { { name: 'New name' } }

      it "updates the requested category" do
        put :update, {:id => category.to_param, :category => new_attributes}, valid_session
        category.reload
        expect(category.name).to eq('New name')
        expect(flash[:notice]).to eq('Category was successfully updated.')
      end

      it "assigns the requested category as @category" do
        put :update, {:id => category.to_param, :category => valid_attributes}, valid_session
        expect(assigns(:category)).to eq(category)
      end

      it "redirects to the restaurant" do
        put :update, {:id => category.to_param, :category => valid_attributes}, valid_session
        expect(response).to redirect_to(category.restaurant)
      end
    end

    describe "with invalid params" do
      it "assigns the category as @category" do
        put :update, {:id => category.to_param, :category => invalid_attributes}, valid_session
        expect(assigns(:category)).to eq(category)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => category.to_param, :category => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested category" do
      expect {
        delete :destroy, {:id => category.to_param}, valid_session
      }.to change(Category, :count).by(-1)
    end

    it "redirects to the restaurant" do
      delete :destroy, {:id => category.to_param}, valid_session
      expect(response).to redirect_to(category.restaurant)
    end
  end

end
