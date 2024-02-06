Rails.application.routes.draw do
  get 'pairings/new'
  get 'pairings/create'
  get 'pairings/index'
  get 'pairings/show'
  devise_for :users
  # Defines the root path route ("/")
  root to: "pages#home"


  resources :wines, only: [:index, :show]
  resources :cheeses, only: [:index, :show]
  resources :favorites, only: [:index, :create, :destroy]
  resources :pairings, only: [:index, :create, :destroy]



  get '/paths', to: 'paths#index'

  get "up" => "rails/health#show", as: :rails_health_check

  resources :pairings, only: [:create, :index] do
    resources :reviews, only: [:create]
  end
  resources :favorites, only: [:create]

  get '/users/:id/profile', to: 'users#profile', as: 'user_profile'

end
