Rails.application.routes.draw do
  
  root to:'feeds#index'

  devise_for :users,path_names:{sign_in:"login",sign_out:"logout"}, 
  controllers: {
    sessions: 'users/sessions',omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :posts , only:[:index,:new,:show,:create,:destroy]
  resources :comments , only:[:create,:destroy]
  resources :likes, only:[:create, :destroy]
end