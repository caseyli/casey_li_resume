require 'rails_helper'

RSpec.describe ResumeEntryNotesController, type: :controller do

  let(:resume_entry_note) do
    create(:resume_entry_note)
  end

  shared_examples 'a user who can manage resume entry notes' do
    describe 'GET #new' do
      it 'renders the template' do
        get :new
        expect(response).to render_template(:new)
      end
    end

    describe 'POST #create' do
      it 'creates the resume entry note' do
        resume_entry_note
        expect {
          post :create, resume_entry_note: attributes_for(:resume_entry_note, resume_entry_id: resume_entry_note.resume_entry.id)
        }.to change(ResumeEntryNote, :count).by(1)
      end

      it 'redirects to the resume entry note path' do
        resume_entry_note
        post :create, resume_entry_note: attributes_for(:resume_entry_note, resume_entry_id: resume_entry_note.resume_entry.id)
        expect(response).to redirect_to(resume_entry_path(assigns(:resume_entry_note).resume_entry))
      end
    end

    describe 'GET #edit' do
      it 'renders the template' do
        get :edit, id: resume_entry_note.id
        expect(response).to render_template(:edit)
      end
    end

    describe 'PUT #update' do
      before(:each) do
        @original_note = resume_entry_note.note
        @new_note = "#{@original_note}-NEW"
      end
      
      it 'updates the resume entry note' do
        put :update, id: resume_entry_note.id, resume_entry_note: { note: @new_note }
        resume_entry_note.reload
        expect(resume_entry_note.note).to eq(@new_note)
      end

      it 'redirects to resume entry note path' do
        put :update, id: resume_entry_note.id, resume_entry_note: { note: @new_note }
        expect(response).to redirect_to(resume_entry_path(assigns(:resume_entry_note).resume_entry))
      end
    end

    describe 'DELETE #destroy' do
      it 'deletes the resume entry note' do
        resume_entry_note
        expect {
          delete :destroy, id: resume_entry_note.id
        }.to change(ResumeEntryNote, :count).by(-1)
      end

      it 'redirects to resume entry notes index' do
        delete :destroy, id: resume_entry_note.id
        expect(response).to redirect_to(resume_entry_path(assigns(:resume_entry_note).resume_entry))
      end
    end
  end

  shared_examples 'a user who cannot manage resume entry notes' do
    describe 'GET #new' do
      it 'renders the template' do
        get :new
        expect(response).to redirect_to(signin_path)
      end
    end

    describe 'POST #create' do
      it 'does not create the resume entry note' do
        expect {
          post :create, resume_entry_note: attributes_for(:resume_entry_note)
        }.to change(ResumeEntryNote, :count).by(0)
      end

      it 'denies access' do
        post :create, resume_entry_note: attributes_for(:resume_entry_note)
        expect(response).to redirect_to(signin_path)
      end
    end

    describe 'GET #edit' do
      it 'denies access' do
        get :edit, id: resume_entry_note.id
        expect(response).to redirect_to(signin_path)
      end
    end

    describe 'PUT #update' do
      before(:each) do
        @original_note = resume_entry_note.note
        @new_note = "#{@original_note}-NEW"
      end
      
      it 'does not update the resume entry note' do
        put :update, id: resume_entry_note.id, resume_entry_note: { note: @new_note }
        resume_entry_note.reload
        expect(resume_entry_note.note).to eq(@original_note)
      end

      it 'denies access' do
        put :update, id: resume_entry_note.id, resume_entry_note: { note: @new_note }
        expect(response).to redirect_to(signin_path)
      end
    end

    describe 'DELETE #destroy' do
      it 'does not delete the resume entry note' do
        resume_entry_note
        expect {
          delete :destroy, id: resume_entry_note.id
        }.to change(ResumeEntryNote, :count).by(0)
      end

      it 'denies access' do
        delete :destroy, id: resume_entry_note.id
        expect(response).to redirect_to(signin_path)
      end
    end
  end

  context 'when not signed in' do
    it_behaves_like 'a user who cannot manage resume entry notes'
  end

  context 'when signed in' do
    before :each do
      session[:signedin] = true
    end

    it_behaves_like 'a user who can manage resume entry notes'
  end
end
