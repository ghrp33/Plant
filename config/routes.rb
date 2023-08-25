Rails.application.routes.draw do
  devise_for :users
  # root to: "plantes#index"
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :plantes, only: %i[index show new create] do
    resources :requests, only: %i[new create]
  end

  resources :requests, only: %i[index]
  get '/myplants', to: 'plantes#myplants'
  patch '/accept/:id', to: 'requests#accept', as: "accept"
  patch '/reject/:id', to: 'requests#reject', as: "reject"
  delete '/cancel/:id', to: 'requests#cancel', as: "cancel"
end
