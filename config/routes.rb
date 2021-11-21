Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :markets do
   resources :bookings do
      resources :messages, only: %i[index create]
    end
  end
  resources :dashboard, only: %i[index]
end
