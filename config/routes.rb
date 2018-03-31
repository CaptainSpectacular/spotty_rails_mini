Rails.application.routes.draw do

  root to: 'sessions#new'

  get 'users/show'

  get 'users/new'

  get 'users/edit'

  get 'sessions/new'


  resources :albums
  resources :songs
  resources :users, exclude: %i[create new]

  get '/sign_up',   to: 'users#new'
  post '/sign_up',  to: 'users#create'
  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
