Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :carts
    resources :items
    resources :orders
    resources :order_items

    root to: 'users#index'
  end

  get 'users/show'
  root to: 'items#index'

  scope(path_names: { show: 'mon_compte', new: 'mon_compte', edit: 'editer_mon_compte' }) do
    devise_for :users, path: 'mon_compte'
  end

  scope(path_names: { show: 'article' }) do
    resources :items, only: %i[index show], path: 'article'
  end

  resources :carts, path: 'mon_panier'

  scope(path_names: { show: 'ma_commande', new: 'paiement', create: 'paiement_valide' }) do
    resources :orders, path: 'commande'
  end

  # resources :join_table_items_orders_controller

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end  

# comment

