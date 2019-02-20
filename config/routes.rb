Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  get '/myjobs', to: 'jobs#myjobs'
  get '/mybookings', to: 'bookings#mybookings'
  resources :jobs do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, except: [:new, :create]
end
