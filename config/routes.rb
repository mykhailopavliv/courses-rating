Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  root 'home#index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }, skip: %i[passwords registrations]

  resources :courses do
    get 'change-published-status', on: :member
    get 'pending', on: :collection
    resources :reviews, only: %i[create destroy]
  end
  resources :users
end
