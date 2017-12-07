Rails.application.routes.draw do
  devise_for :users
  resources :events
  resources :trips
  root to: "calendars#index"

  get 'users/index', to: 'users#index'
  get 'users/show/:id', to: 'users#show'
  get 'calendars/index'
  get 'calendars/show'

  post '/trips/:id', to: 'trips#remove'
  post '/events/:id', to: 'trips#update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
