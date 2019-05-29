Rails.application.routes.draw do
  
  root to:'feeds#index'

  devise_for :users,path_names:{sign_in:"login",sign_out:"logout"}, 
<<<<<<< HEAD
  controllers: { sessions: 'users/sessions',omniauth_callbacks: "users/omniauth_callbacks"}
  
  get "/friendships", to:"friendships#index"

  put "/change/:friendship/stat/:status",to:"friendships#change", as:"change_friendship"

=======
  controllers: {
    sessions: 'users/sessions',omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :posts , only:[:index,:new,:show,:create,:destroy]
  resources :comments , only:[:create,:destroy]
  resources :likes, only:[:create, :destroy]
>>>>>>> f69f4975ce9a1850e90736548e4c23e4f0c5d840
end