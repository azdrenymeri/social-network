Rails.application.routes.draw do
  
  root to:'static_pages#index'

  devise_for :users,path_names:{sign_in:"login",sign_out:"logout"}, 
  controllers: { sessions: 'users/sessions',omniauth_callbacks: "users/omniauth_callbacks"}
  
  
  put "/update/:friendship/stat/:status",to:"friendships#update", as:"change_friendship"
  
  patch 'users/:id', to: 'users#update'
  post 'users/:id', to: 'users#update'

  resources :posts , only:[:index,:new,:show,:create,:destroy]
  resources :comments , only:[:create,:destroy]
  resources :likes, only:[:create, :destroy]
  resources :users, only:[:index,:show,:edit, :update]
  resources :friendships
end