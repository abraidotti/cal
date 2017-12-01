Rails.application.routes.draw do
  get 'events/show'

  get 'events/new'

  get 'events/edit'

  get 'events/create'

  get 'events/update'

  get 'events/destroy'

  get 'calendars/index'

  devise_for :users
  root to: "calendar#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
