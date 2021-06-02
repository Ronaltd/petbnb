Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/my_bookings', to: 'pages#my_bookings', as: :my_bookings
  resources :locals do
    resources :bookings, except: [:index], shallow: true
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
