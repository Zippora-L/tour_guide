Rails.application.routes.draw do
  devise_for :users
  get 'tours/index'
  get 'tours/show'
  get 'tours/create'
  get '/tours/:id/bookings/index_user', to: 'bookings#index_user'
  patch '/tours/:id/bookings/confirm', to: 'bookings#confirm', as: :booking_confirm
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tours, only: [:new, :edit, :index, :show, :create] do
    resources :bookings, only: [:create, :destroy, :create]
  end
  resources :bookings, only: [:index, :index_user]
  resources :users, only: [:show]
    # /
    # /tours
    # /tours/:id/bookings
    # /users/:id
    # /bookings/:id/
    # /users/:id/
    # /users/:id/edit
    # /users/:id/tours
    # /users/:id/tours
    # /users/:id/tours/new
end
