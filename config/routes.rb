Rails.application.routes.draw do
  root to: 'emails#index'

  resources :users
  resources :emails do
    collection do
      post 'incoming'
    end
  end
end
