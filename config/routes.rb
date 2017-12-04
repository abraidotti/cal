Rails.application.routes.draw do
  resources :events

  get 'calendars/index'
  get 'calendars/show'

  devise_for :users
  root to: "calendars#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
