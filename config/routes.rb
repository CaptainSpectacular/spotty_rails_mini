Rails.application.routes.draw do
  root to: 'sessions#new'

  resources :albums
  resources :songs, only: %i[index show] do
    resources :playlist_songs, only: %i[create]
  end
  resources :users, exclude: %i[create] do
    resources :playlists
  end

  get '/sign_up',   to: 'users#new'
  post '/sign_up',  to: 'users#create'
  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  patch '/add',     to: 'playlist_songs#create'
  delete '/remove', to: 'playlist_songs#destroy'
end
