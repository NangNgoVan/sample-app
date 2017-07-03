Rails.application.routes.draw do
  root "static_pages#home"

  get "/home", to: "static_pages#home"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"

  post "/signup",  to: "users#create"
  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"


  resources :users, only: :show

end
