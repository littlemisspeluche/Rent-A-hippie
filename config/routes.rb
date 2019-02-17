Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :jobs do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, except: [:new, :create]
end
