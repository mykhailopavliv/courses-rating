Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }, skip: %i[passwords registrations]

  resources :courses
  resources :users
end
