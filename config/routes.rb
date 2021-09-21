Rails.application.routes.draw do
  #get 'sessions1/new'
  #get 'home/index'
  resources :posts

  root 'static_pages#home'
  get 'static_pages/help', as: "help"

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  get "/apply", to: "sessions1#new"
  post "/apply", to: "sessions1#create"
  delete "/apply", to: "sessions1#destroy"

  resources :users, only: %i(show new create)
  resources :courses, only: %i(show new create)
end
