Rails.application.routes.draw do
<<<<<<< Updated upstream
=======
  resources :book_requests
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :books
  namespace :api do
    namespace :v1 do
      get 'users/count', to: 'users#count'
      get 'users/by/id/:id', to: 'users#show_by_id'
      get 'users/by/username/:name', to: 'users#show_by_username'

      # FOR DEBUG PURPOSES, THESE ARE GETs
        get 'auth/register/:username,:password,:first_name,:last_name,:address,:email', to: 'users#register'
        get 'auth/claim/:token', to: 'users#claim'
        get 'auth/login/:username,:password', to: 'users#login'
        get 'auth/logout/:token', to: 'users#logout'
      # END OF DEBUG PURPOSES

      resources :users, only: []
>>>>>>> Stashed changes

  resources :book_requests
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :books
  
  #/locatebooks take user to a map showing books in his closest vicinity
  get 'locatebooks', to:      'locatebooks'
  get '/users', to: 'users#index'

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
