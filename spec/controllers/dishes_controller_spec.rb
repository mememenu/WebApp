require 'rails_helper'

RSpec.describe DishesController, :type => :controller do
  before do
    sign_in FactoryGirl.create(:admin)
  end

  let(:menu) { FactoryGirl.create(:menu, categories: [FactoryGirl.create(:category)]) }
  let!(:dish) { FactoryGirl.create(:dish, menu: menu, restaurant: menu.restaurant) }
  let(:valid_attributes) do
    { name: 'Cheese', restaurant_id: menu.restaurant_id, menu_id: menu.id, category_id: menu.categories.first }
  end

  let(:invalid_attributes) { { menu_id: '', restaurant_id: menu.restaurant_id } }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all dishes as @dishes" do
      get :index, {}, valid_session
      expect(assigns(:dishes)).to eq([dish])
    end
  end

  describe "GET show" do
    it "assigns the requested dish as @dish" do
      get :show, {:id => dish.to_param}, valid_session
      expect(assigns(:dish)).to eq(dish)
    end
  end

  describe "GET new" do
    it "assigns a new dish as @dish" do
      get :new, {}, valid_session
      expect(assigns(:dish)).to be_a_new(Dish)
    end
  end

  describe "GET edit" do
    it "assigns the requested dish as @dish" do
      get :edit, {:id => dish.to_param}, valid_session
      expect(assigns(:dish)).to eq(dish)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Dish" do
        expect {
          post :create, {:dish => valid_attributes}, valid_session
        }.to change(Dish, :count).by(1)
      end

      it "assigns a newly created dish as @dish" do
        post :create, {:dish => valid_attributes}, valid_session
        expect(assigns(:dish)).to be_a(Dish)
        expect(assigns(:dish)).to be_persisted
      end

      it "redirects to the restaurant" do
        post :create, {:dish => valid_attributes}, valid_session
        expect(response).to redirect_to(assigns[:dish].restaurant)
      end
    end

    describe "dish with default image" do
      it "creates a default image for the dish" do
        image = fixture_file_upload('/images/896x1052.jpeg', 'image/jpeg')
        expect do
          post :create, {
               dish: valid_attributes.merge(default_image_attributes: { avatar: image })
          }, valid_session
        end.to change{ Dish.count }.by(1)

        expect(response).to redirect_to(assigns[:dish].restaurant)
        expect(assigns[:dish].default_image.avatar).to be
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved dish as @dish" do
        post :create, {:dish => invalid_attributes}, valid_session
        expect(assigns(:dish)).to be_a_new(Dish)
      end

      it "re-renders the 'new' template" do
        post :create, {:dish => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) { { name: 'Chicken' } }

      it "updates the requested dish" do
        put :update, {:id => dish.to_param, :dish => new_attributes}, valid_session
        dish.reload
        expect(dish.name).to eq('Chicken')
      end

      it "assigns the requested dish as @dish" do
        put :update, {:id => dish.to_param, :dish => valid_attributes}, valid_session
        expect(assigns(:dish)).to eq(dish)
      end

      it "redirects to the restaurant" do
        put :update, {:id => dish.to_param, :dish => valid_attributes}, valid_session
        expect(response).to redirect_to(dish.restaurant)
      end
    end

    describe "with invalid params" do
      it "assigns the dish as @dish" do
        put :update, {:id => dish.to_param, :dish => invalid_attributes}, valid_session
        expect(assigns(:dish)).to eq(dish)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => dish.to_param, :dish => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested dish" do
      expect {
        delete :destroy, {:id => dish.to_param}, valid_session
      }.to change(Dish, :count).by(-1)
    end

    it "redirects to the restaurant" do
      delete :destroy, {:id => dish.to_param}, valid_session
      expect(response).to redirect_to(dish.restaurant)
    end
  end

end
