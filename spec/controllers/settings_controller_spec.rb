require 'rails_helper'

RSpec.describe SettingsController, type: :controller do

  let(:setting) do
    create(:setting)
  end

  shared_examples 'a user who can manage settings' do
    describe 'GET #index' do
      it 'renders the template' do
        get :index
        expect(response).to render_template(:index)
      end
    end

    describe 'GET #show' do
      it 'renders the template' do
        get :show, params: { id: setting.id }
        expect(response).to render_template(:show)
      end
    end

    describe 'GET #new' do
      it 'renders the template' do
        get :new
        expect(response).to render_template(:new)
      end
    end

    describe 'POST #create' do
      it 'creates the resume entry' do
        expect {
          post :create, params: { setting: attributes_for(:setting) }
        }.to change(Setting, :count).by(1)
      end

      it 'redirects to the resume entry path' do
        post :create, params: { setting: attributes_for(:setting) }
        expect(response).to redirect_to(setting_path(assigns(:setting)))
      end
    end

    describe 'GET #edit' do
      it 'renders the template' do
        get :edit, params: { id: setting.id }
        expect(response).to render_template(:edit)
      end
    end

    describe 'PUT #update' do
      before(:each) do
        @original_key = setting.key
        @new_key = "#{@original_key}-NEW"
      end
      
      it 'updates the resume entry' do
        put :update, params: { id: setting.id, setting: { key: @new_key } }
        setting.reload
        expect(setting.key).to eq(@new_key)
      end

      it 'redirects to resume entry path' do
        put :update, params: { id: setting.id, setting: { key: @new_key } }
        expect(response).to redirect_to(setting_path(assigns(:setting)))
      end
    end

    describe 'DELETE #destroy' do
      it 'deletes the resume entry' do
        setting
        expect {
          delete :destroy, params: { id: setting.id }
        }.to change(Setting, :count).by(-1)
      end

      it 'redirects to settings index' do
        delete :destroy, params: { id: setting.id }
        expect(response).to redirect_to(settings_path)
      end
    end
  end

  shared_examples 'a user who cannot manage settings' do
    describe 'GET #index' do
      it 'denies access' do
        get :index
        expect(response).to redirect_to(root_path)
      end
    end

    describe 'GET #show' do
      it 'renders the template' do
        get :show, params: { id: setting.id }
        expect(response).to redirect_to(root_path)
      end
    end

    describe 'GET #new' do
      it 'renders the template' do
        get :new
        expect(response).to redirect_to(root_path)
      end
    end

    describe 'POST #create' do
      it 'does not create the resume entry' do
        expect {
          post :create, params: { setting: attributes_for(:setting) }
        }.to change(Setting, :count).by(0)
      end

      it 'denies access' do
        post :create, params: { setting: attributes_for(:setting) }
        expect(response).to redirect_to(root_path)
      end
    end

    describe 'GET #edit' do
      it 'denies access' do
        get :edit, params: { id: setting.id }
        expect(response).to redirect_to(root_path)
      end
    end

    describe 'PUT #update' do
      before(:each) do
        @original_key = setting.key
        @new_key = "#{@original_key}-NEW"
      end
      
      it 'does not update the resume entry' do
        put :update, params: { id: setting.id, setting: { key: @new_key } }
        setting.reload
        expect(setting.key).to eq(@original_key)
      end

      it 'denies access' do
        put :update, params: { id: setting.id, setting: { key: @new_key } }
        expect(response).to redirect_to(root_path)
      end
    end

    describe 'DELETE #destroy' do
      it 'does not delete the resume entry' do
        setting
        expect {
          delete :destroy, params: { id: setting.id }
        }.to change(Setting, :count).by(0)
      end

      it 'denies access' do
        delete :destroy, params: { id: setting.id }
        expect(response).to redirect_to(root_path)
      end
    end
  end

  context 'when not signed in' do
    it_behaves_like 'a user who cannot manage settings'
  end

  context 'when signed in as an admin' do
    before :each do
      admin_user = create(:admin_user)
      sign_in admin_user
    end

    it_behaves_like 'a user who can manage settings'
  end
end
