CaseyLiResume::Application.routes.draw do

  resources :settings


  resources :newsletter_sign_ups


  get "users/new"
  get "sessions/new"

  resources :resume_entry_types
  resources :resume_entries
  resources :resume_entry_notes
  resources :sessions,            :only => [:new, :create, :destroy]
  resources :users

  get "pages/landing"
  get "pages/videos"
  get "slideroom" => "pages#slideroom"
  get "pages/home"
  get "pages/skills"
  get "pages/work_experience"
  get "pages/education"
  get "pages/hobbies"
  get "pages/contact"
  get "pages/about"
  get "pages/gittingtoknowyou"
  get "/tutorails" => "pages#tutorails"
  get "/uo" => "pages#uo"
  
  post "pages/contact"
  
  root :to => 'pages#landing'
  
  get '/skills' => "pages#skills"
  get '/work_experience' => "pages#work_experience"
  get '/education' => "pages#education"
  get '/hobbies' => "pages#hobbies"
  get '/contact' => "pages#contact"
  get '/about' => "pages#about"
  get '/signin' => 'sessions#new'
  get '/signout' => 'sessions#destroy'
  get '/jobapplication' => "pages#jobapplication"
  get '/home' => "pages#home"
  get '/gittingtoknowyou' => "pages#gittingtoknowyou"
  get '/videos' => "pages#videos"
  get '/birthday2013' => "pages#birthday2013"
  get '/engagement' => "pages#engagement"
end
