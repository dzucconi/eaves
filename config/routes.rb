Rails.application.routes.draw do
  root to: 'emails#index'

  resources :users
  resources :emails do
    member do
      get 'original'
      get 'rendered'
    end

    collection do
      get 'where'
      get 'remote'
    end
  end
end
