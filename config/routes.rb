Rails.application.routes.draw do
  resources :rooms
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :markets do
    resources :bookings, only: %i[create]
  end
  resources :bookings, except: %i[create] do
    resources :messages, only: %i[index create]
  end

  resources :dashboard, only: %i[index]

  get "pages/howitworks", to: "pages#howitworks"
end
