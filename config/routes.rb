Rails.application.routes.draw do
  root to: 'sessions#new'

  resources :albums
  resources :songs, only: %i[index show]
  resources :users, exclude: %i[create] do
    resources :playlists
  end

  namespace :playlist do
    resources :songs, only: %i[create destroy]
  end

  get '/sign_up',   to: 'users#new'
  post '/sign_up',  to: 'users#create'
  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
