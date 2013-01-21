Catalog::Application.routes.draw do
  devise_for :users

  # resources :categories, :path => "/" do
  #   resources :firms
  # end

  # resources :categories, only: [:index, :new, :create]
  # resources :categories, path: "/", except: [:index, :new, :create] do
  #   resources :firms, except: [:new, :create]
  # end

  # get '*id', to: 'categories#show'
  
  # resources :firms, :only => [:new, :create]



  resources :categories, path: "/" do
    resources :firms, :except => [:new, :create, :show, :edit, :update]
  end


  resources :firms, :only => [:new, :create, :edit, :update]

  # get ":id", :to => "categories#show"

  get ":category_id/:id", :to => "firms#show", :as => :show_firm







  # get "*id", :to => "firms#show"

  # get ":category_id/*categories/:firm_id", :to => "firms#show", :as => :category_firm_path



  # match "firm_new" => "firms#new"

  # get ":category_id/*categories/:firm_id", :to => "firms#show"





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
   root :to => 'categories#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
