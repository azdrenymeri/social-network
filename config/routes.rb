Rails.application.routes.draw do
  
  root to:'feeds#index'

  devise_for :users,path_names:{sign_in:"login",sign_out:"logout"}, 
  controllers: { sessions: 'users/sessions',omniauth_callbacks: "users/omniauth_callbacks"}
  
  get "/friendships", to:"friendships#index"

  put "/change/:friendship/stat/:status",to:"friendships#change", as:"change_friendship"

end