Rails.application.routes.draw do

    get 'home/index'
    resources :posts
    root 'static_pages#home'
    get 'static_pages/help', as: "help"
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"

    resources :users, only: %i(show new create)

end
