require 'rails_helper'

RSpec.describe NewsletterSignUpsController, type: :controller do

  let(:newsletter_sign_up) do
    create(:newsletter_sign_up)
  end

  shared_examples 'a user who can create newsletter sign ups' do
    describe 'POST #create' do
      it 'creates the newsletter_sign_up' do
        expect {
          post :create, params: { newsletter_sign_up: attributes_for(:newsletter_sign_up) }
        }.to change(NewsletterSignUp, :count).by(1)
      end

      it 'redirects to the newsletter sign ups index' do
        post :create, params: { newsletter_sign_up: attributes_for(:newsletter_sign_up) }
        expect(response).to redirect_to(newsletter_sign_ups_path)
      end
    end
  end

  shared_examples 'a user who can manage newsletter sign ups' do
    describe 'GET #index' do
      it 'renders the template' do
        get :index
        expect(response).to render_template(:index)
      end
    end
    
    describe 'GET #new' do
      it 'renders the template' do
        get :new
        expect(response).to render_template(:new)
      end
    end

    describe 'GET #edit' do
      it 'renders the template' do
        get :edit, params: { id: newsletter_sign_up.id }
        expect(response).to render_template(:edit)
      end
    end

    describe 'PUT #update' do
      before(:each) do
        @original_email = newsletter_sign_up.email
        @new_email = "#{@original_email}-NEW"
      end
      
      it 'updates the newsletter_sign_up' do
        put :update, params: { id: newsletter_sign_up.id, newsletter_sign_up: { email: @new_email } }
        newsletter_sign_up.reload
        expect(newsletter_sign_up.email).to eq(@new_email)
      end

      it 'redirects to newsletter sign ups index' do
        put :update, params: { id: newsletter_sign_up.id, newsletter_sign_up: { email: @new_email } }
        expect(response).to redirect_to(newsletter_sign_ups_path)
      end
    end

    describe 'DELETE #destroy' do
      it 'deletes the newsletter sign up' do
        newsletter_sign_up
        expect {
          delete :destroy, params: { id: newsletter_sign_up.id }
        }.to change(NewsletterSignUp, :count).by(-1)
      end

      it 'redirects to newsletter sign ups index' do
        delete :destroy, params: { id: newsletter_sign_up.id }
        expect(response).to redirect_to(newsletter_sign_ups_path)
      end
    end
  end

  shared_examples 'a user who cannot manage newsletter sign ups' do
    describe 'GET #new' do
      it 'renders the template' do
        get :new
        expect(response).to redirect_to(signin_path)
      end
    end
    
    describe 'GET #edit' do
      it 'denies access' do
        get :edit, params: { id: newsletter_sign_up.id }
        expect(response).to redirect_to(signin_path)
      end
    end

    describe 'PUT #update' do
      before(:each) do
        @original_email = newsletter_sign_up.email
        @new_email = "#{@original_email}-NEW"
      end
      
      it 'does not update the newsletter_sign_up' do
        put :update, params: { id: newsletter_sign_up.id, newsletter_sign_up: { email: @new_email } }
        newsletter_sign_up.reload
        expect(newsletter_sign_up.email).to eq(@original_email)
      end

      it 'denies access' do
        put :update, params: { id: newsletter_sign_up.id, newsletter_sign_up: { email: @new_email } }
        expect(response).to redirect_to(signin_path)
      end
    end

    describe 'DELETE #destroy' do
      it 'does not delete the newsletter sign up' do
        newsletter_sign_up
        expect {
          delete :destroy, params: { id: newsletter_sign_up.id }
        }.to change(NewsletterSignUp, :count).by(0)
      end

      it 'denies access' do
        delete :destroy, params: { id: newsletter_sign_up.id }
        expect(response).to redirect_to(signin_path)
      end
    end
  end

  context 'when not signed in' do
    it_behaves_like 'a user who can create newsletter sign ups'
    it_behaves_like 'a user who cannot manage newsletter sign ups'
  end

  context 'when signed in' do
    before :each do
      session[:signedin] = true
    end

    it_behaves_like 'a user who can create newsletter sign ups'
    it_behaves_like 'a user who can manage newsletter sign ups'
  end
end
