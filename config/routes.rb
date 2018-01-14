Rails.application.routes.draw do
  get 'search/index'

  get 'deliverymethods/index'

  get 'buddhistsermons/index'

  get 'items/index'

  get 'collections/index'

  get 'temples/index'

  get "settings" , to: "settings#index"

  root to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get "altarsearch", to: "search#altar"
  get "reportsearch", to: "search#report"
  get "bdsearch", to: "search#bd"
  resources :users, only: [:index, :show, :new, :create]
  resources :relationships, only: [:create, :destroy]
  resources :sects
  resources :kinds
  resources :reports
  resources :deliverymethods
  resources :buddhistsermons
  resources :profits
  resources :costlists
  resources :taxations
  resources :items
  resources :temples
  resources :officers
  resources :meals
  resources :collections
  resources :suppliers
  resources :altars
  resources :enforcements
  resources :ceremonialplaces
  resources :remarks, only: [:create, :destroy]
  resources :employees
  resources :ledgers
  resources :reservations
  resources :earnings, only: [:create, :destroy] do
    member do
      put :sort
    end
  end
  resources :costs, only: [:create, :destroy] do
    member do
      put :sort
    end
  end
  resources :members do
    member do
      put 'sort'
    end
  end
  resources :families do
    member do
      put 'sort'
    end
  end
end
