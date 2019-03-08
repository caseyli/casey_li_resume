CaseyLiResume::Application.routes.draw do

  devise_for :users
  root :to => 'pages#home'
  get "users/new"

  resources :settings
  resources :newsletter_sign_ups, except: [:show]
  resources :resume_entry_types
  resources :resume_entries
  resources :resume_entry_notes, except: [:index, :show]

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

  get 'admin' => 'pages#admin'  
  get '/legacy' => 'pages#legacy'
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
