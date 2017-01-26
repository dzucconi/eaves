Rails.application.routes.draw do
  root to: 'emails#index'

  resources :users
  resources :emails
end
