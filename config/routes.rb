Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }, skip: %i[passwords registrations]

  resources :courses do
    resources :reviews, only: %i[create destroy]
  end
  resources :users
end
