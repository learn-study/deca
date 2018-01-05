Rails.application.routes.draw do
  get 'temples/index'

  get "settings" , to: "settings#index"

  root to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users, only: [:index, :show, :new, :create]
  resources :relationships, only: [:create, :destroy]
  resources :sects
  resources :kinds
  resources :reports
  resources :judges
  resources :profits
  resources :costlists
  resources :suppliers
  resources :altars
  resources :enforcements
  resources :ceremonialplaces
  resources :remarks, only: [:create, :destroy]
  resources :employees
  resources :ledgers
  resources :reservations
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
