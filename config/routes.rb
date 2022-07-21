Rails.application.routes.draw do
 
  

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users

  resources :rooms


  root to: "home#top"

  resources :reservations
  post 'reservations/confirm'

end
