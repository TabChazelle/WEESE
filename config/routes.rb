Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :wines do
    resources :favorite, only: [:index, :create, :destroy]
    member do
      get 'toggle_favorite', to: 'wines#toggle_favorite'
    end
  end

  resources :cheeses do
    resources :favorite, only: [:index, :create, :destroy]
    member do
      get 'toggle_favorite', to: 'cheeses#toggle_favorite'
    end
  end

  resources :pairings do
    resources :favorite, only: [:index, :create, :destroy]
    member do
      get 'toggle_favorite', to: 'pairings#toggle_favorite'
    end
  end


  resources :cheeses, only: [:index, :show]
  resources :pairings, only: [:index, :create, :destroy, :new, :show] do
    resources :reviews, only: [:create]
  end

  resources :users, only: [:show, :edit, :update] do
    member do
      get "favorites", to: "users#favorites"
    end
  end

  resources :openai, only: [:show, :create]
  resources :paths, only: [:index]
  resources :rails_health, only: [:show], path: 'up'

  # Define a route for the search functionality
  get 'search', to: 'search#index', as: 'search'
  get '/profile', to: 'users#profile', as: 'profile'
end


# don't break my routes !!!
