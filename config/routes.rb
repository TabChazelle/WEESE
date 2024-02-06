Rails.application.routes.draw do
  get 'openai/test'
  get 'search/index'
  get 'pairings/new'
  get 'pairings/create'
  get 'pairings/index'
  get 'pairings/show'
  devise_for :users
  # Defines the root path route ("/")
  root to: "pages#home"


  resources :wines, only: [:index, :show]
  resources :cheeses, only: [:index, :show]
  resources :favorites, only: [:index]
  resources :pairings, only: [:index]



  resources :pairings, only: %i[new create index show]

  get '/paths', to: 'paths#index'

  get "up" => "rails/health#show", as: :rails_health_check
  get 'favorite_pairings', to: 'pairings#favorites', as: 'favorite_pairings'


  resources :pairings, only: [:create, :index] do
    resources :reviews, only: [:create]
  end
  resources :favorites, only: [:create]

  get '/profile', to: 'users#profile', as: 'profile'

  get '/search', to: 'search#index'

end
