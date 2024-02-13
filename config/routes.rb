Rails.application.routes.draw do
  devise_for :users
  root to: "pages#welcome"
  get 'home', to: 'pages#home', as: 'home'

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

  resources :reviews, only: [:create, :new, :destroy]

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

  resource :weesewizard, controller: 'openai', only: [:show, :create]
  post '/openai/openai_request', to: 'openai#openai_request'

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

  get 'search/autocomplete', to: 'search#autocomplete'


  get 'my_reviews', to: 'users#my_reviews', as: 'my_reviews'


end
