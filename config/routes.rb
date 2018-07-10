Rails.application.routes.draw do
  root to: 'users#index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :users
end
