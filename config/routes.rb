Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  resources :events
  resources :trips

  get 'calendars/index'
  get 'calendars/show'

  devise_for :users
  root to: "calendars#index"
  post '/trips/:id', to: 'trips#remove'
  post '/events/:id', to: 'trips#update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
