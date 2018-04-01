Rails.application.routes.draw do
  root to: 'sessions#new'
  
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
