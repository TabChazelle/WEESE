Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :wines, only: [:index, :show]
  resources :cheeses, only: [:index, :show]
  resources :pairings, only: [:index, :create, :destroy, :new, :show] do
  resources :reviews, only: [:create]
      end


      resources :wines do
        resources :favorites, only: [:index, :create, :destroy]
      member do
        post :toggle_favorite, to: 'wines#toggle_favorite'
        end
      end

  resources :openai, only: [:show]
  resources :openai, only: [:create]

  resources :paths, only: [:index]
  resources :rails_health, only: [:show], path: 'up'
  resources :users, only: [], path: 'profile'

  # Define a route for the search functionality
  get 'search', to: 'search#index', as: 'search'
  get '/profile', to: 'users#profile', as: 'profile'

end
