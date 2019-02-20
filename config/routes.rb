Rails.application.routes.draw do

  devise_for :users
  root to: 'jobs#index'

  resources :jobs do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, except: [:new, :create]
end
