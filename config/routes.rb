Rails.application.routes.draw do
  get 'tours/index'
  get 'tours/show'
  get 'tours/create'
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tours, only: [ :index, :show, :create ]
    # /
    # /tours
    # /tours/:id/bookings
    # /tours/:id/
    # /users/:id
    # /bookings/:id/
    # /users/:id/
    # /users/:id/edit
    # /users/:id/tours
    # /users/:id/tours/edit
    # /users/:id/tours
    # /users/:id/tours/new

end
