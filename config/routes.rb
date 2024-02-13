Rails.application.routes.draw do
  devise_for :users

  root to: "pages#welcome"
  get 'home', to: 'pages#home', as: 'home'

  resources :wines do
    resources :favorites, only: [:index, :create, :destroy]
    member do
      get 'toggle_favorite'
    end
    resources :reviews, only: [:create]
  end

  resources :cheeses do
    resources :favorites, only: [:index, :create, :destroy]
    member do
      get 'toggle_favorite'
    end
    resources :reviews, only: [:create]
  end

  resources :pairings do
    resources :favorites, only: [:index, :create, :destroy]
    member do
      get 'toggle_favorite'
    end
    resources :reviews, only: [:new, :create]
  end

  resources :users, only: [:show, :edit, :update] do
    member do
      get "favorites"
    end
    get 'edit_favorites', on: :member
  end

  resource :weesewizard, controller: 'openai', only: [:show, :create]
  post '/openai/openai_request', to: 'openai#openai_request'

  resources :paths, only: [:index]
  resources :rails_health, only: [:show], path: 'up'

  get 'search', to: 'search#index', as: 'search'
  get 'profile', to: 'users#profile', as: 'profile'
  get 'favorites', to: 'users#favorites', as: 'favorites'
  get 'edit_favorites', to: 'users#edit_favorites'
  get 'my_reviews', to: 'users#my_reviews', as: 'my_reviews'

  # Route for showing cheeses by country
  get 'cheeses/show_by_country/:country_name', to: 'cheeses#show_by_country', as: 'show_cheeses_by_country'

  # Route for showing cheeses by country under the countries namespace
  namespace :countries do
    get 'cheeses/:country_name', to: 'cheeses#show_by_country', as: 'show_cheeses_by_country'
  end
end
