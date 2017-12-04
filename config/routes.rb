Rails.application.routes.draw do
  resources :events
  resources :calendars

  get 'calendars/index'

  devise_for :users
  root to: "calendars#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
