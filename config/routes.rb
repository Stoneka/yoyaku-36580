Rails.application.routes.draw do
  devise_for :customers
  root to:'items#index'
  resources :items do
    collection do
      get 'manage'
    end
    resources :reserves , only: [:create, :destroy]
  end
  resources :carts , only: [:show]
  get 'reserve', to: 'reserves#manage'
  #上記は予約管理ページのurlを与えている。
end
