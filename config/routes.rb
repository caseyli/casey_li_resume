CaseyLiResume::Application.routes.draw do

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
  get "pages/home"
  get "pages/skills"
  get "pages/work_experience"
  get "pages/education"
  get "pages/hobbies"
  get "pages/contact"
  get "pages/about"
  get "pages/gittingtoknowyou"
  get "/tutorails" => "pages#tutorails"
  
  post "pages/contact"
  
  root :to => 'pages#landing'
  
  match '/skills', :to => "pages#skills"
  match '/work_experience', :to => "pages#work_experience"
  match '/education', :to => "pages#education"
  match '/hobbies', :to => "pages#hobbies"
  match '/contact', :to => "pages#contact"
  match '/about', :to => "pages#about"
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  match '/jobapplication', :to => "pages#jobapplication"
  match '/home', :to => "pages#home"
  match '/gittingtoknowyou', :to => "pages#gittingtoknowyou"
  match '/videos', :to => "pages#videos"
  match '/birthday2013', :to => "pages#birthday2013"
  match '/engagement', :to => "pages#engagement"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
