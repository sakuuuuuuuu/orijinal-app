Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  # get 'posts', to: 'posts#index'
  root to: 'items#index'
  # resources :users, only: [:edit, :update]
  resources :users
  resources :items do
  # root to: 'purchase_records#index'
  resources :purchase_records, only:[:create,:index]
  end
end
