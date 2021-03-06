TestApp::Application.routes.draw do
  get "users/new"

  mathjax 'mathjax'
  root to: 'static_pages#home'

  resources :users

  resources :sessions, only: [:new, :create, :destroy]

  resources :resumes, only: [ :home, :createpage, :create, :postdata , :checkdata, :viewlist, :viewedit , :delete, :createtemplate, :cssapi, :checkcssfile, :postcssfile] 

  resources :homepages, only: [ :home, :create, :postdata, :view, :delete, :download, :checkdata, :cssapi ]

  match '/signup', to: "users#new"
  match "/help", to: 'static_pages#help'
  match '/about', to: 'static_pages#about'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  match '/resumes', to: 'resumes#home'
  match '/resumes/createpage', to: 'resumes#createpage'
  match '/homepages', to: 'homepages#home'

  
  match '/resumes/postdata', to: 'resumes#postdata', via: :post
  match '/resumes/checkdata', to: 'resumes#checkdata', via: :get
  match '/resumes/viewlist', to: 'resumes#viewlist'
  match '/resumes/viewedit', to: 'resumes#viewedit'
  match '/resumes/delete', to: 'resumes#delete'
  match '/resumes/createtemplate', to: 'resumes#createtemplate'
  match '/resumes/download', to: 'resumes#download'
  match '/resumes/cssapi', to: "resumes#cssapi", via: :get
  match '/resumes/checkcssfile', to: "resumes#checkcssfile", via: :get
  match '/resumes/postcssfile', to: "resumes#postcssfile", via: :post

  match '/homepages/create', to: 'homepages#create'
  match '/homepages/postdata',to: 'homepages#postdata', via: :post
  match '/homepages/view', to:'homepages#view'
  match '/homepages/delete', to:'homepages#delete'
  match '/homepages/checkdata', to:'homepages#checkdata'
  match '/homepages/download', to:'homepages#download'
  match '/homepages/cssapi', to: "homepages#cssapi", via: :get

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

  # You can have the routes of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
