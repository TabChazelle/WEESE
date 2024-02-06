Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :wines, only: [:index, :show]
  resources :cheeses, only: [:index, :show]

  resources :favorites, only: [:index, :create, :destroy]
  resources :pairings, only: [:index, :create, :destroy, :new, :show] do
    get 'favorites', on: :collection

    resources :reviews, only: [:create]
  end
  resources :openai, only: [:show]

  resources :paths, only: [:index]
  resources :rails_health, only: [:show], path: 'up'
  resources :users, only: [], path: 'profile'
  resources :search, only: [:index]
end
