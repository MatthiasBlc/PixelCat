Rails.application.routes.draw do
  get 'users/show'
  root to: 'items#index'

  devise_for :users

  resources :items, only: %i[index show]
  resources :carts
  resources :orders

  # resources :join_table_items_orders_controller

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
