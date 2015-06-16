require 'rails_helper'


RSpec.describe ImagesController, :type => :controller do
  before do
    sign_in FactoryGirl.create(:admin)
  end

  let!(:image) { FactoryGirl.create(:image) }
  let(:valid_attributes) { { dish_id: FactoryGirl.create(:dish).id } }

  let(:invalid_attributes) { { dish_id: '' }  }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all images as @images" do
      get :index, {}, valid_session
      expect(assigns(:images)).to eq([image])
    end
  end

  describe "GET show" do
    it "assigns the requested image as @image" do
      get :show, {:id => image.to_param}, valid_session
      expect(assigns(:image)).to eq(image)
    end
  end

  describe "GET edit" do
    it "assigns the requested image as @image" do
      get :edit, {:id => image.to_param}, valid_session
      expect(assigns(:image)).to eq(image)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Image" do
        expect {
          post :create, {:image => valid_attributes}, valid_session
        }.to change(Image, :count).by(1)
      end

      it "assigns a newly created image as @image" do
        post :create, {:image => valid_attributes}, valid_session
        expect(assigns(:image)).to be_a(Image)
        expect(assigns(:image)).to be_persisted
      end

      it "redirects to the created image" do
        post :create, {:image => valid_attributes}, valid_session
        expect(response).to redirect_to(Image.last)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        { avatar: fixture_file_upload('/images/896x1052.jpeg', 'image/jpeg') }
      }

      it "updates the requested image" do
        put :update, {:id => image.to_param, :image => new_attributes}, valid_session
        image.reload
        expect(image.avatar.exists?).to be(true)
      end

      it "assigns the requested image as @image" do
        put :update, {:id => image.to_param, :image => valid_attributes}, valid_session
        expect(assigns(:image)).to eq(image)
      end

      it "redirects to the image" do
        put :update, {:id => image.to_param, :image => valid_attributes}, valid_session
        expect(response).to redirect_to(image)
      end
    end

    describe "with invalid params" do
      it "assigns the image as @image" do
        put :update, {:id => image.to_param, :image => invalid_attributes}, valid_session
        expect(assigns(:image)).to eq(image)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => image.to_param, :image => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested image" do
      expect {
        delete :destroy, {:id => image.to_param}, valid_session
      }.to change(Image, :count).by(-1)
    end

    it "redirects to the images list" do
      delete :destroy, {:id => image.to_param}, valid_session
      expect(response).to redirect_to(images_url)
    end
  end

end
