Rails.application.routes.draw do
  get 'users/show'
  root to: 'items#index'

  devise_for :users
  resources :users, only: [:show, :new, :create, :edit, :update]
  resources :items, only: %i[index show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
