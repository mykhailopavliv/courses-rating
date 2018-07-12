Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }, skip: %i[passwords sessions registrations]
  as :user do
    delete 'signout' => 'devise/sessions#destroy', as: :destroy_user_session
  end

  resources :courses
  resources :users
end
