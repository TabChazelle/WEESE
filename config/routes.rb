Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :wines do
    resources :favorites, only: [:index, :create, :destroy]
    member do
      get 'toggle_favorite', to: 'wines#toggle_favorite'
    end
  end

  resources :cheeses do
    resources :favorites, only: [:index, :create, :destroy]
    member do
      get 'toggle_favorite', to: 'cheeses#toggle_favorite'
    end
  end

  resources :pairings do
    resources :favorites, only: [:index, :create, :destroy]
    member do
      get 'toggle_favorite', to: 'pairings#toggle_favorite'
    end
  end

  resources :reviews, only: [:create, :new]

  resources :pairings, only: [:index, :create, :destroy, :new, :show] do
    resources :reviews, only: [:new, :create]
  end

  resources :wines do
    resources :reviews, only: [:create]
  end

  resources :users, only: [:show, :edit, :update] do
    member do
      get "favorites", to: "users#favorites"
    end
  end

  resources :openai, only: [:show, :create] do
    collection do
      post :openai_request
    end
  end

  resources :users do
    get 'edit_favorites', on: :member
  end


  resources :paths, only: [:index]
  resources :rails_health, only: [:show], path: 'up'

  # Define a route for the search functionality
  get 'search', to: 'search#index', as: 'search'
  get '/profile', to: 'users#profile', as: 'profile'
  get 'favorites', to: 'users#favorites', as: 'favorites'
  get 'edit_favorites', to: 'users#edit_favorites'


end
