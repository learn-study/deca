Rails.application.routes.draw do



  get 'destinations/index'

  get "settings" , to: "settings#index"

  root to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get "altarsearch", to: "search#altar"
  get "reportsearch", to: "search#report"
  get "bdsearch", to: "search#bd"
  get "serchitemreport", to: "search#itemreport"
  get "serchitemaltar", to: "search#itemaltar"
  get "serchitembd", to: "search#itembd"
  resources :users, only: [:index, :show, :new, :create]
  resources :relationships, only: [:create, :destroy]
  resources :sects
  resources :destinations
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
  resources :enforcements do
    collection do
      get :giftserch
      get :itemserch
    end
  end
  resources :ceremonialplaces
  resources :remarks, only: [:create, :destroy]
  resources :employees
  resources :ledgers do
    collection do
      get :itemsort
    end
  end
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
    collection do
      get 'posSearch'
    end
  end
  resources :families do
    member do
      put 'sort'
    end
  end
end
