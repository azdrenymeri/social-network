Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root to:'feeds#index'

  post '/accept', to: 'friendships#accept'

  resources :posts,       only:   [:create, :destroy]
  resources :likes,       only:   [:create, :destroy]
  resources :comments,    only:   [:create, :destroy]
  resources :users,       except: [:new, :create, :edit]
  resources :friendships, only:   [:index, :create, :destroy]
end