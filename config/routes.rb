First_Website::Application.routes.draw do
  devise_for :users, :skip => [:sessions]
 
  devise_scope :user do 
    root to: 'static_pages#home'
    get 'signin' => 'devise/sessions#new', :as => :new_user_session
    post 'signin' => 'devise/sessions#create', :as => :user_session
    delete 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session
    match '/sessions/user', to: 'devise/sessions#create', via: :post
  end
  
  #resources :contact
  resources :portfolio 

  delete 'portfolio' => 'portfolio#destroy', :as => :destroy_upload

   #do
    #get "serve", :on => :member
 # end
   # member do
    #  get :following, :followers
    #end
  #end
 # resources :microposts,    only: [:create, :destroy]
 # resources :relationships, only: [:create, :destroy]
  #root  'static_pages#home'
  #match '/help',    to: 'static_pages#help',    via: 'get'
  #match '/about',   to: 'static_pages#about',   via: 'get'
 # match '/contact_forms/thank_you', to: 'contacts#show', via: 'get'
  match 'contact', to: 'contact#new', :via => :get
  match 'contact', to: 'contact#create', :via => :post
  #match '/uploads/new', to: 'uploads#new', via: 'get'
  #match '/uploads/index', to: 'uploads#index', via: 'get'
 #match '/uploads/index', to: 'uploads#index', via: :post
  #match '/contact', to: 'contact_form#new', via: 'get'
  match '/resume', to: 'static_pages#resume', via: 'get'
  match '/references', to: 'static_pages#references', via: 'get'
# match '/portfolio', to: 'portfolio#show', via: 'get'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end 
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
