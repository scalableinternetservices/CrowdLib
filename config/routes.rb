Rails.application.routes.draw do
  
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :books
  resources :book_requests
  resources :users
  
  #/locatebooks take user to a map showing books in his closest vicinity
  get 'locatebooks', to:      'locatebooks#locatebooks'
  get '/users', to: 'users#index'
  get '/profile', to: 'users#profile'

  get 'around/:lat,:lng', to: 'books#by_location', :constraints => {:lat => /\-?\d+(.\d+)?/, :lng => /\-?\d+(.\d+)?/ }  
  get 'get_around/:lat,:lng/:range', to: 'books#books_around', :constraints => {:lat => /\-?\d+(.\d+)?/, :lng => /\-?\d+(.\d+)?/ , :range => /\d+/ }
  post 'book_transactions/request', to: 'book_transactions#request_book'
  post 'book_transactions/return', to: 'book_transactions#return_book'
  post 'book_transactions/approve', to: 'book_transactions#approve_book_request'
  post 'book_transactions/reject', to: 'book_transactions#reject_book_request'
  post '/rate' => 'rater#create', :as => 'rate'
  match "/books/add_new_comment" => "books#add_new_comment", :as => "add_new_comment_on_book", :via => [:post]
  get '/book_transactions', to: 'book_transactions#index'

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
