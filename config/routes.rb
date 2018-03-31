Rails.application.routes.draw do
  get 'users/show'

  get 'users/new'

  get 'users/edit'

  get 'sessions/new'

  resources :users
  resources :albums
  resources :songs

  get '/sign_up',   to: 'users#new'
  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
