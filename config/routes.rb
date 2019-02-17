Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :jobs do
    resources :bookings
  end
end
