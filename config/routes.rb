Rails.application.routes.draw do
  # get 'carts/index'
  # get 'carts/show'
  root to: 'items#index'

  devise_for :users
  resources :users, only: [:show, :new, :create, :edit, :update]

  resources :items, only: %i[index show]

  resources :carts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
