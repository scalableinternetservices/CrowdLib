Rails.application.routes.draw do

  resources :book_requests
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :books
  
  #/locatebooks take user to a map showing books in his closest vicinity
  get 'locatebooks', to:      'locatebooks'
  get '/users', to: 'users#index'

      get 'locations/by/id/:id', to: 'locations#show_by_id'
      get 'locations/around/:lat,:lng', to: 'locations#show_by_distance', 
        defaults: { limit: 1000 }, 
        constraints: {:lat => /\-*\d+.\d+/ , :lng => /\-*\d+.\d+/ }
      get 'locations/around/:lat,:lng/within/:limit', to: 'locations#show_by_distance', 
        constraints: { :lat => /\-*\d+.\d+/ , :lng => /\-*\d+.\d+/ , :limit => /\d+/}
      delete 'locations/by/id/:id', to: 'locations#delete_by_id'
      
      resources :locations, only: []
    end
  end
#/locatebooks take user to a map showing books in his closest vicinity
get 'locatebooks', to:      'locatebooks'
get '/users', to: 'users#index'
get '/profile', to: 'users#profile'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
