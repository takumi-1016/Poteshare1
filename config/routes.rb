Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }


  resources :users

  resources :rooms
  get "room/post", to: "rooms#post"

  root to: "home#top"

  resources :reservations
  post 'reservations/confirm'

end
