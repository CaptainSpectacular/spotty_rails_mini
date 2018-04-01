Rails.application.routes.draw do

  get 'playlists/show'

  get 'playlists/index'

  root to: 'sessions#new'

  get 'users/show'

  get 'users/new'

  get 'users/edit'

  get 'sessions/new'

  patch '/add', to: 'playlists#update'

  resources :albums
  resources :songs
  resources :users, exclude: %i[create new] do
    resources :playlists
  end

  get '/sign_up',   to: 'users#new'
  post '/sign_up',  to: 'users#create'
  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
