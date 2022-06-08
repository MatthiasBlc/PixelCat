Rails.application.routes.draw do
  get 'users/show'
  # get 'carts/index'
  # get 'carts/show'
  root to: 'items#index'

  devise_for :users

  resources :items, only: %i[index show]

  resources :carts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
