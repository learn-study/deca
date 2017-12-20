Rails.application.routes.draw do
  get 'updateinfo/index'

  root to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users, only: [:index, :show, :new, :create]
  resources :relationships, only: [:create, :destroy]
  resources :sects
  resources :kinds
  resources :remarks, only: [:create, :destroy]
  resources :ledgers
  resources :earnings, only: [:create, :destroy]
  resources :costs, only: [:create, :destroy]
  resources :members do
    member do
      put 'sort'
    end
    collection do
      get "hoge"
    end
  end
  resources :families do
    member do
      put 'sort'
    end
  end
end
