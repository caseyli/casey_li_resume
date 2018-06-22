require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  let(:newsletter_sign_up) do
    create(:newsletter_sign_up)
  end

  shared_examples 'a user who can view public pages' do
    describe 'GET #home' do
      it 'renders the template' do
        get :home
        expect(response).to render_template(:home)
      end
    end

    describe 'GET #videos' do
      it 'renders the template' do
        get :videos
        expect(response).to render_template(:videos)
      end
    end

    describe 'GET #slideroom' do
      it 'renders the template' do
        get :slideroom
        expect(response).to render_template(:slideroom)
      end
    end

    describe 'GET #gittingtoknowyou' do
      it 'renders the template' do
        get :gittingtoknowyou
        expect(response).to redirect_to(videos_path)
      end
    end

    describe 'GET #tutorails' do
      it 'renders the template' do
        get :tutorails
        expect(response).to render_template(:tutorails)
      end
    end

    describe 'GET #uo' do
      it 'renders the template' do
        get :uo
        expect(response).to render_template(:uo)
      end
    end

    describe 'GET #birthday2013' do
      it 'renders the template' do
        get :birthday2013
        expect(response).to render_template(:birthday2013)
      end
    end
       
    describe 'GET #legacy' do
      it 'renders the template' do
        get :legacy
        expect(response).to render_template(:legacy)
      end
    end

    describe 'GET #skills' do
      it 'renders the template' do
        ResumeEntryType.create(description: "Skills") 
        get :skills
        expect(response).to render_template(:skills)
      end
    end
        
    describe 'GET #work_experience' do
      it 'renders the template' do
        ResumeEntryType.create(description: "Work Experience") 
        get :work_experience
        expect(response).to render_template(:work_experience)
      end
    end

    describe 'GET #education' do
      it 'renders the template' do
        ResumeEntryType.create(description: "Education") 
        get :education
        expect(response).to render_template(:education)
      end
    end
        
    describe 'GET #hobbies' do
      it 'renders the template' do
        ResumeEntryType.create(description: "Hobbies") 
        get :hobbies
        expect(response).to render_template(:hobbies)
      end
    end

    describe 'GET #contact' do
      it 'renders the template' do
        get :contact
        expect(response).to render_template(:contact)
      end
    end

    describe 'GET #about' do
      it 'renders the template' do
        get :about
        expect(response).to render_template(:about)
      end
    end

    describe 'GET #jobapplication' do
      it 'renders the template' do
        get :jobapplication
        expect(response).to render_template(:jobapplication)
      end
    end
  end

  shared_examples 'a user who can view admin pages' do
    describe 'GET #admin' do
      it 'renders the template' do
        get :admin
        expect(response).to render_template(:admin)
      end
    end
  end

  context 'when not signed in' do
    it_behaves_like 'a user who can view public pages'
  end

  context 'when signed in' do
    before :each do
      session[:signedin] = true
    end

    it_behaves_like 'a user who can view public pages'
    it_behaves_like 'a user who can view admin pages'
  end
end
