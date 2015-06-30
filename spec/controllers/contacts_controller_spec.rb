require 'rails_helper'


RSpec.describe ContactsController, :type => :controller do
  before do
    sign_in FactoryGirl.create(:admin)
  end

  let!(:contact) { Contact.create! first_name: 'John', last_name: 'Doe' }

  let(:valid_attributes) { { first_name: 'John', last_name: 'Snow' } }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all contacts as @contacts" do
      get :index, {}, valid_session
      expect(assigns(:contacts)).to eq([contact])
    end
  end

  describe "GET show" do
    it "assigns the requested contact as @contact" do
      get :show, {:id => contact.to_param}, valid_session
      expect(assigns(:contact)).to eq(contact)
    end
  end

  describe "GET new" do
    it "assigns a new contact as @contact" do
      get :new, {}, valid_session
      expect(assigns(:contact)).to be_a_new(Contact)
    end
  end

  describe "GET edit" do
    it "assigns the requested contact as @contact" do
      get :edit, {:id => contact.to_param}, valid_session
      expect(assigns(:contact)).to eq(contact)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Contact" do
        expect {
          post :create, {:contact => valid_attributes}, valid_session
        }.to change(Contact, :count).by(1)
      end

      it "assigns a newly created contact as @contact" do
        post :create, {:contact => valid_attributes}, valid_session
        expect(assigns(:contact)).to be_a(Contact)
        expect(assigns(:contact)).to be_persisted
      end

      it "redirects to the root_path" do
        post :create, {:contact => valid_attributes}, valid_session
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) { { first_name: 'Sean' } }

      it "updates the requested contact" do
        put :update, {:id => contact.to_param, :contact => new_attributes}, valid_session
        contact.reload
        expect(contact.first_name).to eq('Sean')
      end

      it "assigns the requested contact as @contact" do
        put :update, {:id => contact.to_param, :contact => valid_attributes}, valid_session
        expect(assigns(:contact)).to eq(contact)
      end

      it "redirects to the contact" do
        put :update, {:id => contact.to_param, :contact => valid_attributes}, valid_session
        expect(response).to redirect_to(contact)
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested contact" do
      expect {
        delete :destroy, {:id => contact.to_param}, valid_session
      }.to change(Contact, :count).by(-1)
    end

    it "redirects to the contacts list" do
      delete :destroy, {:id => contact.to_param}, valid_session
      expect(response).to redirect_to(contacts_url)
    end
  end

end
