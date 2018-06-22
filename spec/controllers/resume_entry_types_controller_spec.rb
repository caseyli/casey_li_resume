require 'rails_helper'

RSpec.describe ResumeEntryTypesController, type: :controller do

  let(:resume_entry_type) do
    create(:resume_entry_type)
  end

  shared_examples 'a user who can manage resume entry types' do
    describe 'GET #new' do
      it 'renders the template' do
        get :new
        expect(response).to render_template(:new)
      end
    end

    describe 'POST #create' do
      it 'creates the resume entry type' do
        resume_entry_type
        expect {
          post :create, resume_entry_type: attributes_for(:resume_entry_type)
        }.to change(ResumeEntryType, :count).by(1)
      end

      it 'redirects to the resume entry types index' do
        resume_entry_type
        post :create, resume_entry_type: attributes_for(:resume_entry_type)
        expect(response).to redirect_to(resume_entry_types_path)
      end
    end

    describe 'GET #edit' do
      it 'renders the template' do
        get :edit, id: resume_entry_type.id
        expect(response).to render_template(:edit)
      end
    end

    describe 'PUT #update' do
      before(:each) do
        @original_description = resume_entry_type.description
        @new_description = "#{@original_description}-NEW"
      end
      
      it 'updates the resume entry type' do
        put :update, id: resume_entry_type.id, resume_entry_type: { description: @new_description }
        resume_entry_type.reload
        expect(resume_entry_type.description).to eq(@new_description)
      end

      it 'redirects to resume entry types index' do
        put :update, id: resume_entry_type.id, resume_entry_type: { description: @new_description }
        expect(response).to redirect_to(resume_entry_types_path)
      end
    end

    describe 'DELETE #destroy' do
      it 'deletes the resume entry type' do
        resume_entry_type
        expect {
          delete :destroy, id: resume_entry_type.id
        }.to change(ResumeEntryType, :count).by(-1)
      end

      it 'redirects to resume entry types index' do
        delete :destroy, id: resume_entry_type.id
        expect(response).to redirect_to(resume_entry_types_path)
      end
    end
  end

  shared_examples 'a user who cannot manage resume entry types' do
    describe 'GET #new' do
      it 'renders the template' do
        get :new
        expect(response).to redirect_to(signin_path)
      end
    end

    describe 'POST #create' do
      it 'does not create the resume entry type' do
        expect {
          post :create, resume_entry_type: attributes_for(:resume_entry_type)
        }.to change(ResumeEntryType, :count).by(0)
      end

      it 'denies access' do
        post :create, resume_entry_type: attributes_for(:resume_entry_type)
        expect(response).to redirect_to(signin_path)
      end
    end

    describe 'GET #edit' do
      it 'denies access' do
        get :edit, id: resume_entry_type.id
        expect(response).to redirect_to(signin_path)
      end
    end

    describe 'PUT #update' do
      before(:each) do
        @original_description = resume_entry_type.description
        @new_description = "#{@original_description}-NEW"
      end
      
      it 'does not update the resume entry type' do
        put :update, id: resume_entry_type.id, resume_entry_type: { description: @new_description }
        resume_entry_type.reload
        expect(resume_entry_type.description).to eq(@original_description)
      end

      it 'denies access' do
        put :update, id: resume_entry_type.id, resume_entry_type: { description: @new_description }
        expect(response).to redirect_to(signin_path)
      end
    end

    describe 'DELETE #destroy' do
      it 'does not delete the resume entry type' do
        resume_entry_type
        expect {
          delete :destroy, id: resume_entry_type.id
        }.to change(ResumeEntryType, :count).by(0)
      end

      it 'denies access' do
        delete :destroy, id: resume_entry_type.id
        expect(response).to redirect_to(signin_path)
      end
    end
  end

  context 'when not signed in' do
    it_behaves_like 'a user who cannot manage resume entry types'
  end

  context 'when signed in' do
    before :each do
      session[:signedin] = true
    end

    it_behaves_like 'a user who can manage resume entry types'
  end
end
