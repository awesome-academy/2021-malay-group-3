Rails.application.routes.draw do
  get 'applies/edit'
  get 'apply/edit'
  get 'user_courses/edit'
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do

    get 'home/index'
    resources :posts

    root 'static_pages#home'
    get 'static_pages/info', as: "info"

    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    get "/users", to: "users#index"
    resources :users
    resources :account_activations, only: :edit
    resources :password_resets, only: [:new, :create, :edit, :update]

    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :courses
    resources :applies
  end
end
