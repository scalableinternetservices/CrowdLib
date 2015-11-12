Rails.application.routes.draw do
  devise_for :users
  get 'homepage/index'

  root 'homepage#index'
  resource 'users'

  get 'profile', to: 'users#profile'
  patch 'profile/save', to: 'users#save'

  resource 'books'
  get 'book/new', to: 'books#create'
  post 'save_book_data', to: 'books#save_book_data'

  get 'book/:id', to: 'books#get'
  get 'book/update/:id', to: 'books#update'

  get 'user/:id', to: 'homepage#by_user'
  get 'author/:author', to: 'homepage#by_author'

  post 'book/borrow/:id', to: 'books#borrow'

  get 'around/:lat,:lng', to: 'homepage#by_location', :constraints => {:lat => /\-?\d+(.\d+)?/, :lng => /\-?\d+(.\d+)?/ }  
  get 'get_around/:lat,:lng', to: 'homepage#books_around', :constraints => {:lat => /\-?\d+(.\d+)?/, :lng => /\-?\d+(.\d+)?/ , :range => /\d+/ }

end
