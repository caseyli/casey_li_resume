require 'rails_helper'

RSpec.describe ResumeEntriesController, type: :controller do

  let(:resume_entry) do
    create(:resume_entry)
  end

  shared_examples 'a user who can manage resume entries' do
    describe 'GET #index' do
      it 'renders the template' do
        get :index
        expect(response).to render_template(:index)
      end
    end

    describe 'GET #show' do
      it 'renders the template' do
        get :show, id: resume_entry.id
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
          post :create, resume_entry: attributes_for(:resume_entry)
        }.to change(ResumeEntry, :count).by(1)
      end

      it 'redirects to the resume entry path' do
        post :create, resume_entry: attributes_for(:resume_entry)
        expect(response).to redirect_to(resume_entry_path(assigns(:resume_entry)))
      end
    end

    describe 'GET #edit' do
      it 'renders the template' do
        get :edit, id: resume_entry.id
        expect(response).to render_template(:edit)
      end
    end

    describe 'PUT #update' do
      before(:each) do
        @original_title = resume_entry.title
        @new_title = "#{@original_title}-NEW"
      end
      
      it 'updates the resume entry' do
        put :update, id: resume_entry.id, resume_entry: { title: @new_title }
        resume_entry.reload
        expect(resume_entry.title).to eq(@new_title)
      end

      it 'redirects to resume entry path' do
        put :update, id: resume_entry.id, resume_entry: { title: @new_title }
        expect(response).to redirect_to(resume_entry_path(assigns(:resume_entry)))
      end
    end

    describe 'DELETE #destroy' do
      it 'deletes the resume entry' do
        resume_entry
        expect {
          delete :destroy, id: resume_entry.id
        }.to change(ResumeEntry, :count).by(-1)
      end

      it 'redirects to resume entries index' do
        delete :destroy, id: resume_entry.id
        expect(response).to redirect_to(resume_entries_path)
      end
    end
  end

  shared_examples 'a user who cannot manage resume entries' do
    describe 'GET #index' do
      it 'denies access' do
        get :index
        expect(response).to redirect_to(signin_path)
      end
    end

    describe 'GET #show' do
      it 'renders the template' do
        get :show, id: resume_entry.id
        expect(response).to redirect_to(signin_path)
      end
    end

    describe 'GET #new' do
      it 'renders the template' do
        get :new
        expect(response).to redirect_to(signin_path)
      end
    end

    describe 'POST #create' do
      it 'does not create the resume entry' do
        expect {
          post :create, resume_entry: attributes_for(:resume_entry)
        }.to change(ResumeEntry, :count).by(0)
      end

      it 'denies access' do
        post :create, resume_entry: attributes_for(:resume_entry)
        expect(response).to redirect_to(signin_path)
      end
    end

    describe 'GET #edit' do
      it 'denies access' do
        get :edit, id: resume_entry.id
        expect(response).to redirect_to(signin_path)
      end
    end

    describe 'PUT #update' do
      before(:each) do
        @original_title = resume_entry.title
        @new_title = "#{@original_title}-NEW"
      end
      
      it 'does not update the resume entry' do
        put :update, id: resume_entry.id, resume_entry: { title: @new_title }
        resume_entry.reload
        expect(resume_entry.title).to eq(@original_title)
      end

      it 'denies access' do
        put :update, id: resume_entry.id, resume_entry: { title: @new_title }
        expect(response).to redirect_to(signin_path)
      end
    end

    describe 'DELETE #destroy' do
      it 'does not delete the resume entry' do
        resume_entry
        expect {
          delete :destroy, id: resume_entry.id
        }.to change(ResumeEntry, :count).by(0)
      end

      it 'denies access' do
        delete :destroy, id: resume_entry.id
        expect(response).to redirect_to(signin_path)
      end
    end
  end

  context 'when not signed in' do
    it_behaves_like 'a user who cannot manage resume entries'
  end

  context 'when signed in' do
    before :each do
      session[:signedin] = true
    end

    it_behaves_like 'a user who can manage resume entries'
  end
end
