Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  root 'home#index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }, skip: %i[passwords registrations]

  resources :courses do
    collection do
      resources :pending, only: [:index], controller: 'courses/pending', as: :pending_courses
    end
    get 'change_status', on: :member, controller: 'courses/pending'
    resources :reviews, only: %i[create destroy]
  end
  resources :users
end
