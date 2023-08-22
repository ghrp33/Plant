Rails.application.routes.draw do
  devise_for :users
  root to: "plantes#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :plantes, only: %i[index show new create] do
    resources :requests, only: %i[index show new create update]
  end

  resources :requests, only: %i[index show]
end
