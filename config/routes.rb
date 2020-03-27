Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :show]
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :sessions, only: [:create]
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  root 'sessions#index'
  resources :events

  resources :event_attendances, only: [:create]

end

