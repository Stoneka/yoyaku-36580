Rails.application.routes.draw do
  devise_for :customers
  root to:'items#index'
  resources :items do
    collection do
      get 'manage'
    end
    resources :reserves , only: [:create]
  end
  resources :carts , only: [:show]

end
